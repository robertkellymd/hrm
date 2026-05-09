#' Main nonbinary script
#' 
#' R script for finding winning hypotheses among those within the data frame Race,
#' using probability densities to calculate Bayesian factors.
#' When finished, the expression Race[Race$winner == 1, ] shows the winners.
#' 
#' @author Robert Kelly, ORCID 0000-0002-1783-498X
#' @date May 8, 2026
#' @license MIT

#' Runs a single Race to find winning hypotheses
#'
#' @param spec_ID  The ID for specifications in a row of Hyp_race_params
#' @param run_ID  Unique identifier for each Race ("run")
#'
#' @returns  Race data frame with winners and associated parameters
#'
run_Race_prob_dens <- function(spec_ID, run_ID) {
  Nrows = Hyp_race_params$Nhyp[spec_ID]  # Nrows - number of rows in Race given by Nhyp
  # The Race data frame is initialized.  Starting R-value for all hypotheses is logRstart
  Race <- data.frame(row_ID=1:Nrows,
                     sampleN=Hyp_race_params$sampleN[spec_ID], # N per sample
                     effect=0,   # actual effect size for each hypothesis
                     logR=Hyp_race_params$logRstart[spec_ID],  # log10 R-value
                     winner=0,   # winner == 1 identifies winning hypotheses
                     Ntrials=0)  # number of trials performed for each hypothesis
  # hyp_true_index sets up assignment of the true hypotheses to random rows in Race,
  # by providing the row IDs that will correspond to the true hypotheses.
  hyp_true_index = sample(1:Nrows,
                   length(effect_sizes),  # effect sizes for the true hypotheses
                   replace=FALSE)
  # Each effect size, corresponding to a true hypothesis, is assigned
  # randomly to a row in Race.  The global variable effect_sizes determines
  # the actual d-values for each true hypothesis to be seeded in Race.
  Race$effect[hyp_true_index] <- effect_sizes
  
  Nwin = 0  # initialization of the number of winners found
  row_index = 1:Nrows  # Vector to be sorted in descending order of logR
  # row_index[1] always points to the target row for next trial in the loop
  
  # Find winners until Nwin_target reached
  while (Nwin < Hyp_race_params$Nwin_target[spec_ID]) {
    row_index = resort(row_index, Race)  # ensure sorted by descending logR-values
    # Continue trials for top hypothesis at row_index[1], as long as logR highest
    while (Race$logR[row_index[1]] >= Race$logR[row_index[2]]) {
      # Perform trial for top row if most promising hypothesis (highest logR)
      Race$Ntrials[row_index[1]] = Race$Ntrials[row_index[1]] + 1  # update trial count
      
      # Convert random trial outcome to logBF based on actual effect size.
      logBF = log_prob_ratio(spec_ID, Race$effect[row_index[1]])
      
      # Update logR value by adding logBF
      Race$logR[row_index[1]] = Race$logR[row_index[1]] + logBF
      # If logR target reached, label the hypothesis a winner and drop from further consideration
      if (Race$logR[row_index[1]] >= Hyp_race_params$logRfinish[spec_ID]) {
        Race$winner[row_index[1]] = 1  # label the hypothesis a winner
        Nwin = Nwin + 1  # increment the total winner count
        row_index = row_index[2:length(row_index)]  # drop the winning rownum
        break
      }
    }
  }
  Results = Race[Race$winner == 1,]  # data collected for winning hypotheses 
  Results$Nsamples_total = sum(Race$Ntrials)  # total cost of finding them
  Results$run_ID = run_ID  # Add a run_ID variable to the data frame
  return(Results)
}

#' Runs the nonbinary races whose parameters are specified in the
#' global data frame Hyp_race_params.
#'
#' @param spec_ID  The ID for specifications in a row of Hyp_race_params
#'
#' @returns  Races, showing the winning hypotheses with selected parameters.
#'
#' @examples
#' run_Races_nonbinary(6) runs the Races specified by Hyp_race_params[6, ]
#' 
run_Races_nonbinary <- function(spec_ID) {
  run_ID = 1  # keeps track of how many races have been run (iteration number)
  Races = run_Race_prob_dens(spec_ID, run_ID)  # first race result
  # Continue while loop until target for number of iterations reached.
  while (run_ID < Hyp_race_params$Niterations[spec_ID]) { 
    run_ID = run_ID + 1
    # Append results of each successive race to Races
    Races = rbind(Races,run_Race_prob_dens(spec_ID, run_ID))
  }
  return(Races)  # Return collected races specified in Hyp_race_params[sample_ID, ]
}
