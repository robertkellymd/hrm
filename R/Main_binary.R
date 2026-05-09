#' Main binary script
#'
#' R script for finding winning hypotheses among those within the data frame Race,
#' using the binary approach to calculate Bayesian factors.
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
run_Race_binary <- function(spec_ID, run_ID, d_to_beta, logBFpos, logBFneg) {
  Nrows = Hyp_race_params$Nhyp[spec_ID]  # Nrows - number of rows in Race given by Nhyp
  # The Race dataframe is initialized.  Starting R-value for all hypotheses is logRstart
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
      if (runif(1) >= d_to_beta$beta[d_to_beta$d == Race$effect[row_index[1]]]) {
        logBF = logBFpos}  # trial outcome positive
      else {logBF = logBFneg}  # trial outcome negative
      
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

#' Runs the binary races whose parameters are specified in the
#' global dataframe Hyp_race_params.
#'
#' @param spec_ID  The ID for specifications in a row of Hyp_race_params
#'
#' @returns  Races, showing the winning hypotheses with selected parameters.
#'
#' @examples
#' run_Races_binary(6) runs the Races specified by Hyp_race_params[6, ]
#' 
run_Races_binary <- function(spec_ID) {
  # This function provides Monte Carlo simulation of what could happen if we
  # empirically try to find true hypotheses among a large number of false hypotheses
  # using the binary approach where each random trial is judged to have positive or
  # negative outcome and through repeated testing one or more winners move all
  # the way to the "finish line" where the R-value is deemed high enough to
  # consider the winners confirmed as true hypotheses.
  
  # The actual effects sizes for true hypotheses need to be specified in
  # advance in the the global variable effect_sizes, a vector of Cohen's d-values,
  # which can be limited to a single value.  The remaining parameters need to be
  # specified in the global data frame Hyp_race_params.  Two of these parameters
  # are the sample size for each trial, N, and the effect size, d_estimate, the 
  # estimate used for testing and evaluation of whether hypothesis confirmation 
  # has been reached.  These values for N and d_estimate are used to determine
  # the value of alpha that yields maximum expected confirmation velocity.  This
  # alpha-level is then used for all simulated hypothesis tests.

  N = Hyp_race_params$sampleN[spec_ID]  # sample size for each trial
  d_estimate = Hyp_race_params$d_estimate[spec_ID]
  sig_fig = 8  # number of significant figures for alpha derived below
  # Velocity_max finds the optimal alpha to the desired # significant figures
  Velocity_max_params = Velocity_max(N, d_estimate, sig_fig)
  alpha = Velocity_max_params[3]  # alpha that maximizes confirmation velocity
  beta_estimate = alpha_to_beta(alpha, N, d_estimate) # corresponding beta estimate
  
  # Setting up the d_to_beta lookup table to reduce execution time
  d_to_beta <- data.frame(d=c(0,sort(unique(effect_sizes))),  # d-values
                          beta=0)  # beta values
  for (i in 1:nrow(d_to_beta)) {
    d_to_beta$beta[i] = alpha_to_beta(alpha, N, d_to_beta$d[i])
  }
  
  # Log10 of Bayesian factors for positive and negative outcomes, respectively
  logBFpos = log10((1 - beta_estimate)/alpha)
  logBFneg = log10(beta_estimate/(1 - alpha))

  run_ID = 1  # keeps track of how many races have been run 
  Races = run_Race_binary(spec_ID, run_ID, d_to_beta, logBFpos, logBFneg)  # first race result
  # Continue while loop until target for number of iterations reached.
    while (run_ID < Hyp_race_params$Niterations[spec_ID]) {
    run_ID = run_ID + 1
    # Append results of each successive race to Races
    Races = rbind(Races,run_Race_binary(spec_ID, run_ID, d_to_beta, logBFpos, logBFneg))
  }
  return(Races)  # Return collected races specified in Hyp_race_params[sample_ID, ]
}
