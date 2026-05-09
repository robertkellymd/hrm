#' Collects and organizes results from the outputs of the Example1 script
#' 
#' @author Robert Kelly, ORCID 0000-0002-1783-498X
#' @date May 8, 2026
#' @license MIT

# Hyp_race_params data frame contains parameters for the Hypothesis Race simulation.
# Those parameters are:
sampleN_ID <- c(1:18)  # ID to pick out a set of parameters
d_estimate <- 0.2
d_actual <- c(rep(0.2, times = 6),
              rep(0.4, times = 6),
              rep(0.8, times = 6))  # Cohen's d estimate for simulations
sampleN <- c(5,10,20,40,80,160)  # sample sizes tried in simulations
Bin_mean <- 0  # Mean number trials per iteration, for binary results
Bin_min <- 0  # Minimum values for binary results
Bin_max <- 0  # Maximum values for binary results
Bin_SE <- 0  # Standard errors for binary results
Bin_SE_minus <- 0  # Standard errors * -1 for binary results
Bin_Nlosers <- 0  # Number of iterations confirming a false hypothesis
Nonbin_mean <- 0  # Mean number trials per iteration, for binary results
Nonbin_min <- 0  # Minimum values for binary results
Nonbin_max <- 0  # Maximum values for binary results
Nonbin_SE <- 0  # Standard errors for binary results
Nonbin_SE_minus <- 0  # Standard errors * -1 for binary results
Nonbin_Nlosers <- 0  # Number of iterations confirming a false hypothesis

Example1_results <<- data.frame(sampleN_ID,
                                d_actual,
                                sampleN,
                                Bin_mean,
                                Bin_min,
                                Bin_max,
                                Bin_SE,
                                Bin_SE_minus,
                                Bin_Nlosers,
                                Nonbin_mean,
                                Nonbin_min,
                                Nonbin_max,
                                Nonbin_SE,
                                Nonbin_SE_minus,
                                Nonbin_Nlosers)
                              
Example1_results$Bin_mean <- c(
  mean(Bin_iter5000_Nwin1_N5_d.2est_d.2act$Nsamples_total),
  mean(Bin_iter5000_Nwin1_N10_d.2est_d.2act$Nsamples_total),
  mean(Bin_iter5000_Nwin1_N20_d.2est_d.2act$Nsamples_total),
  mean(Bin_iter5000_Nwin1_N40_d.2est_d.2act$Nsamples_total),
  mean(Bin_iter5000_Nwin1_N80_d.2est_d.2act$Nsamples_total),
  mean(Bin_iter5000_Nwin1_N160_d.2est_d.2act$Nsamples_total),
  mean(Bin_iter5000_Nwin1_N5_d.2est_d.4act$Nsamples_total),
  mean(Bin_iter5000_Nwin1_N10_d.2est_d.4act$Nsamples_total),
  mean(Bin_iter5000_Nwin1_N20_d.2est_d.4act$Nsamples_total),
  mean(Bin_iter5000_Nwin1_N40_d.2est_d.4act$Nsamples_total),
  mean(Bin_iter5000_Nwin1_N80_d.2est_d.4act$Nsamples_total),
  mean(Bin_iter5000_Nwin1_N160_d.2est_d.4act$Nsamples_total),
  mean(Bin_iter5000_Nwin1_N5_d.2est_d.8act$Nsamples_total),
  mean(Bin_iter5000_Nwin1_N10_d.2est_d.8act$Nsamples_total),
  mean(Bin_iter5000_Nwin1_N20_d.2est_d.8act$Nsamples_total),
  mean(Bin_iter5000_Nwin1_N40_d.2est_d.8act$Nsamples_total),
  mean(Bin_iter5000_Nwin1_N80_d.2est_d.8act$Nsamples_total),
  mean(Bin_iter5000_Nwin1_N160_d.2est_d.8act$Nsamples_total)
)

Example1_results$Bin_min <- c(
  min(Bin_iter5000_Nwin1_N5_d.2est_d.2act$Nsamples_total),
  min(Bin_iter5000_Nwin1_N10_d.2est_d.2act$Nsamples_total),
  min(Bin_iter5000_Nwin1_N20_d.2est_d.2act$Nsamples_total),
  min(Bin_iter5000_Nwin1_N40_d.2est_d.2act$Nsamples_total),
  min(Bin_iter5000_Nwin1_N80_d.2est_d.2act$Nsamples_total),
  min(Bin_iter5000_Nwin1_N160_d.2est_d.2act$Nsamples_total),
  min(Bin_iter5000_Nwin1_N5_d.2est_d.4act$Nsamples_total),
  min(Bin_iter5000_Nwin1_N10_d.2est_d.4act$Nsamples_total),
  min(Bin_iter5000_Nwin1_N20_d.2est_d.4act$Nsamples_total),
  min(Bin_iter5000_Nwin1_N40_d.2est_d.4act$Nsamples_total),
  min(Bin_iter5000_Nwin1_N80_d.2est_d.4act$Nsamples_total),
  min(Bin_iter5000_Nwin1_N160_d.2est_d.4act$Nsamples_total),
  min(Bin_iter5000_Nwin1_N5_d.2est_d.8act$Nsamples_total),
  min(Bin_iter5000_Nwin1_N10_d.2est_d.8act$Nsamples_total),
  min(Bin_iter5000_Nwin1_N20_d.2est_d.8act$Nsamples_total),
  min(Bin_iter5000_Nwin1_N40_d.2est_d.8act$Nsamples_total),
  min(Bin_iter5000_Nwin1_N80_d.2est_d.8act$Nsamples_total),
  min(Bin_iter5000_Nwin1_N160_d.2est_d.8act$Nsamples_total)
)

Example1_results$Bin_max <- c(
  max(Bin_iter5000_Nwin1_N5_d.2est_d.2act$Nsamples_total),
  max(Bin_iter5000_Nwin1_N10_d.2est_d.2act$Nsamples_total),
  max(Bin_iter5000_Nwin1_N20_d.2est_d.2act$Nsamples_total),
  max(Bin_iter5000_Nwin1_N40_d.2est_d.2act$Nsamples_total),
  max(Bin_iter5000_Nwin1_N80_d.2est_d.2act$Nsamples_total),
  max(Bin_iter5000_Nwin1_N160_d.2est_d.2act$Nsamples_total),
  max(Bin_iter5000_Nwin1_N5_d.2est_d.4act$Nsamples_total),
  max(Bin_iter5000_Nwin1_N10_d.2est_d.4act$Nsamples_total),
  max(Bin_iter5000_Nwin1_N20_d.2est_d.4act$Nsamples_total),
  max(Bin_iter5000_Nwin1_N40_d.2est_d.4act$Nsamples_total),
  max(Bin_iter5000_Nwin1_N80_d.2est_d.4act$Nsamples_total),
  max(Bin_iter5000_Nwin1_N160_d.2est_d.4act$Nsamples_total),
  max(Bin_iter5000_Nwin1_N5_d.2est_d.8act$Nsamples_total),
  max(Bin_iter5000_Nwin1_N10_d.2est_d.8act$Nsamples_total),
  max(Bin_iter5000_Nwin1_N20_d.2est_d.8act$Nsamples_total),
  max(Bin_iter5000_Nwin1_N40_d.2est_d.8act$Nsamples_total),
  max(Bin_iter5000_Nwin1_N80_d.2est_d.8act$Nsamples_total),
  max(Bin_iter5000_Nwin1_N160_d.2est_d.8act$Nsamples_total)
)

Example1_results$Bin_SE <- c(
  (1/sqrt(5000)) * sd(Bin_iter5000_Nwin1_N5_d.2est_d.2act$Nsamples_total),
  (1/sqrt(5000)) * sd(Bin_iter5000_Nwin1_N10_d.2est_d.2act$Nsamples_total),
  (1/sqrt(5000)) * sd(Bin_iter5000_Nwin1_N20_d.2est_d.2act$Nsamples_total),
  (1/sqrt(5000)) * sd(Bin_iter5000_Nwin1_N40_d.2est_d.2act$Nsamples_total),
  (1/sqrt(5000)) * sd(Bin_iter5000_Nwin1_N80_d.2est_d.2act$Nsamples_total),
  (1/sqrt(5000)) * sd(Bin_iter5000_Nwin1_N160_d.2est_d.2act$Nsamples_total),
  (1/sqrt(5000)) * sd(Bin_iter5000_Nwin1_N5_d.2est_d.4act$Nsamples_total),
  (1/sqrt(5000)) * sd(Bin_iter5000_Nwin1_N10_d.2est_d.4act$Nsamples_total),
  (1/sqrt(5000)) * sd(Bin_iter5000_Nwin1_N20_d.2est_d.4act$Nsamples_total),
  (1/sqrt(5000)) * sd(Bin_iter5000_Nwin1_N40_d.2est_d.4act$Nsamples_total),
  (1/sqrt(5000)) * sd(Bin_iter5000_Nwin1_N80_d.2est_d.4act$Nsamples_total),
  (1/sqrt(5000)) * sd(Bin_iter5000_Nwin1_N160_d.2est_d.4act$Nsamples_total),
  (1/sqrt(5000)) * sd(Bin_iter5000_Nwin1_N5_d.2est_d.8act$Nsamples_total),
  (1/sqrt(5000)) * sd(Bin_iter5000_Nwin1_N10_d.2est_d.8act$Nsamples_total),
  (1/sqrt(5000)) * sd(Bin_iter5000_Nwin1_N20_d.2est_d.8act$Nsamples_total),
  (1/sqrt(5000)) * sd(Bin_iter5000_Nwin1_N40_d.2est_d.8act$Nsamples_total),
  (1/sqrt(5000)) * sd(Bin_iter5000_Nwin1_N80_d.2est_d.8act$Nsamples_total),
  (1/sqrt(5000)) * sd(Bin_iter5000_Nwin1_N160_d.2est_d.8act$Nsamples_total)
)

Example1_results$Bin_SE_minus <- -1 * Example1_results$Bin_SE

Example1_results$Bin_Nlosers <- c(
  sum(Bin_iter5000_Nwin1_N5_d.2est_d.2act$effect == 0.0),
  sum(Bin_iter5000_Nwin1_N10_d.2est_d.2act$effect == 0.0),
  sum(Bin_iter5000_Nwin1_N20_d.2est_d.2act$effect == 0.0),
  sum(Bin_iter5000_Nwin1_N40_d.2est_d.2act$effect == 0.0),
  sum(Bin_iter5000_Nwin1_N80_d.2est_d.2act$effect == 0.0),
  sum(Bin_iter5000_Nwin1_N160_d.2est_d.2act$effect == 0.0),
  sum(Bin_iter5000_Nwin1_N5_d.2est_d.4act$effect == 0.0),
  sum(Bin_iter5000_Nwin1_N10_d.2est_d.4act$effect == 0.0),
  sum(Bin_iter5000_Nwin1_N20_d.2est_d.4act$effect == 0.0),
  sum(Bin_iter5000_Nwin1_N40_d.2est_d.4act$effect == 0.0),
  sum(Bin_iter5000_Nwin1_N80_d.2est_d.4act$effect == 0.0),
  sum(Bin_iter5000_Nwin1_N160_d.2est_d.4act$effect == 0.0),
  sum(Bin_iter5000_Nwin1_N5_d.2est_d.8act$effect == 0.0),
  sum(Bin_iter5000_Nwin1_N10_d.2est_d.8act$effect == 0.0),
  sum(Bin_iter5000_Nwin1_N20_d.2est_d.8act$effect == 0.0),
  sum(Bin_iter5000_Nwin1_N40_d.2est_d.8act$effect == 0.0),
  sum(Bin_iter5000_Nwin1_N80_d.2est_d.8act$effect == 0.0),
  sum(Bin_iter5000_Nwin1_N160_d.2est_d.8act$effect == 0.0)
)

Example1_results$Nonbin_mean <- c(
  mean(Nonbin_iter5000_Nwin1_N5_d.2est_d.2act$Nsamples_total),
  mean(Nonbin_iter5000_Nwin1_N10_d.2est_d.2act$Nsamples_total),
  mean(Nonbin_iter5000_Nwin1_N20_d.2est_d.2act$Nsamples_total),
  mean(Nonbin_iter5000_Nwin1_N40_d.2est_d.2act$Nsamples_total),
  mean(Nonbin_iter5000_Nwin1_N80_d.2est_d.2act$Nsamples_total),
  mean(Nonbin_iter5000_Nwin1_N160_d.2est_d.2act$Nsamples_total),
  mean(Nonbin_iter5000_Nwin1_N5_d.2est_d.4act$Nsamples_total),
  mean(Nonbin_iter5000_Nwin1_N10_d.2est_d.4act$Nsamples_total),
  mean(Nonbin_iter5000_Nwin1_N20_d.2est_d.4act$Nsamples_total),
  mean(Nonbin_iter5000_Nwin1_N40_d.2est_d.4act$Nsamples_total),
  mean(Nonbin_iter5000_Nwin1_N80_d.2est_d.4act$Nsamples_total),
  mean(Nonbin_iter5000_Nwin1_N160_d.2est_d.4act$Nsamples_total),
  mean(Nonbin_iter5000_Nwin1_N5_d.2est_d.8act$Nsamples_total),
  mean(Nonbin_iter5000_Nwin1_N10_d.2est_d.8act$Nsamples_total),
  mean(Nonbin_iter5000_Nwin1_N20_d.2est_d.8act$Nsamples_total),
  mean(Nonbin_iter5000_Nwin1_N40_d.2est_d.8act$Nsamples_total),
  mean(Nonbin_iter5000_Nwin1_N80_d.2est_d.8act$Nsamples_total),
  mean(Nonbin_iter5000_Nwin1_N160_d.2est_d.8act$Nsamples_total)
)

Example1_results$Nonbin_min <- c(
  min(Nonbin_iter5000_Nwin1_N5_d.2est_d.2act$Nsamples_total),
  min(Nonbin_iter5000_Nwin1_N10_d.2est_d.2act$Nsamples_total),
  min(Nonbin_iter5000_Nwin1_N20_d.2est_d.2act$Nsamples_total),
  min(Nonbin_iter5000_Nwin1_N40_d.2est_d.2act$Nsamples_total),
  min(Nonbin_iter5000_Nwin1_N80_d.2est_d.2act$Nsamples_total),
  min(Nonbin_iter5000_Nwin1_N160_d.2est_d.2act$Nsamples_total),
  min(Nonbin_iter5000_Nwin1_N5_d.2est_d.4act$Nsamples_total),
  min(Nonbin_iter5000_Nwin1_N10_d.2est_d.4act$Nsamples_total),
  min(Nonbin_iter5000_Nwin1_N20_d.2est_d.4act$Nsamples_total),
  min(Nonbin_iter5000_Nwin1_N40_d.2est_d.4act$Nsamples_total),
  min(Nonbin_iter5000_Nwin1_N80_d.2est_d.4act$Nsamples_total),
  min(Nonbin_iter5000_Nwin1_N160_d.2est_d.4act$Nsamples_total),
  min(Nonbin_iter5000_Nwin1_N5_d.2est_d.8act$Nsamples_total),
  min(Nonbin_iter5000_Nwin1_N10_d.2est_d.8act$Nsamples_total),
  min(Nonbin_iter5000_Nwin1_N20_d.2est_d.8act$Nsamples_total),
  min(Nonbin_iter5000_Nwin1_N40_d.2est_d.8act$Nsamples_total),
  min(Nonbin_iter5000_Nwin1_N80_d.2est_d.8act$Nsamples_total),
  min(Nonbin_iter5000_Nwin1_N160_d.2est_d.8act$Nsamples_total)
)

Example1_results$Nonbin_max <- c(
  max(Nonbin_iter5000_Nwin1_N5_d.2est_d.2act$Nsamples_total),
  max(Nonbin_iter5000_Nwin1_N10_d.2est_d.2act$Nsamples_total),
  max(Nonbin_iter5000_Nwin1_N20_d.2est_d.2act$Nsamples_total),
  max(Nonbin_iter5000_Nwin1_N40_d.2est_d.2act$Nsamples_total),
  max(Nonbin_iter5000_Nwin1_N80_d.2est_d.2act$Nsamples_total),
  max(Nonbin_iter5000_Nwin1_N160_d.2est_d.2act$Nsamples_total),
  max(Nonbin_iter5000_Nwin1_N5_d.2est_d.4act$Nsamples_total),
  max(Nonbin_iter5000_Nwin1_N10_d.2est_d.4act$Nsamples_total),
  max(Nonbin_iter5000_Nwin1_N20_d.2est_d.4act$Nsamples_total),
  max(Nonbin_iter5000_Nwin1_N40_d.2est_d.4act$Nsamples_total),
  max(Nonbin_iter5000_Nwin1_N80_d.2est_d.4act$Nsamples_total),
  max(Nonbin_iter5000_Nwin1_N160_d.2est_d.4act$Nsamples_total),
  max(Nonbin_iter5000_Nwin1_N5_d.2est_d.8act$Nsamples_total),
  max(Nonbin_iter5000_Nwin1_N10_d.2est_d.8act$Nsamples_total),
  max(Nonbin_iter5000_Nwin1_N20_d.2est_d.8act$Nsamples_total),
  max(Nonbin_iter5000_Nwin1_N40_d.2est_d.8act$Nsamples_total),
  max(Nonbin_iter5000_Nwin1_N80_d.2est_d.8act$Nsamples_total),
  max(Nonbin_iter5000_Nwin1_N160_d.2est_d.8act$Nsamples_total)
)

Example1_results$Nonbin_SE <- c(
  (1/sqrt(5000)) * sd(Nonbin_iter5000_Nwin1_N5_d.2est_d.2act$Nsamples_total),
  (1/sqrt(5000)) * sd(Nonbin_iter5000_Nwin1_N10_d.2est_d.2act$Nsamples_total),
  (1/sqrt(5000)) * sd(Nonbin_iter5000_Nwin1_N20_d.2est_d.2act$Nsamples_total),
  (1/sqrt(5000)) * sd(Nonbin_iter5000_Nwin1_N40_d.2est_d.2act$Nsamples_total),
  (1/sqrt(5000)) * sd(Nonbin_iter5000_Nwin1_N80_d.2est_d.2act$Nsamples_total),
  (1/sqrt(5000)) * sd(Nonbin_iter5000_Nwin1_N160_d.2est_d.2act$Nsamples_total),
  (1/sqrt(5000)) * sd(Nonbin_iter5000_Nwin1_N5_d.2est_d.4act$Nsamples_total),
  (1/sqrt(5000)) * sd(Nonbin_iter5000_Nwin1_N10_d.2est_d.4act$Nsamples_total),
  (1/sqrt(5000)) * sd(Nonbin_iter5000_Nwin1_N20_d.2est_d.4act$Nsamples_total),
  (1/sqrt(5000)) * sd(Nonbin_iter5000_Nwin1_N40_d.2est_d.4act$Nsamples_total),
  (1/sqrt(5000)) * sd(Nonbin_iter5000_Nwin1_N80_d.2est_d.4act$Nsamples_total),
  (1/sqrt(5000)) * sd(Nonbin_iter5000_Nwin1_N160_d.2est_d.4act$Nsamples_total),
  (1/sqrt(5000)) * sd(Nonbin_iter5000_Nwin1_N5_d.2est_d.8act$Nsamples_total),
  (1/sqrt(5000)) * sd(Nonbin_iter5000_Nwin1_N10_d.2est_d.8act$Nsamples_total),
  (1/sqrt(5000)) * sd(Nonbin_iter5000_Nwin1_N20_d.2est_d.8act$Nsamples_total),
  (1/sqrt(5000)) * sd(Nonbin_iter5000_Nwin1_N40_d.2est_d.8act$Nsamples_total),
  (1/sqrt(5000)) * sd(Nonbin_iter5000_Nwin1_N80_d.2est_d.8act$Nsamples_total),
  (1/sqrt(5000)) * sd(Nonbin_iter5000_Nwin1_N160_d.2est_d.8act$Nsamples_total)
)

Example1_results$Nonbin_SE_minus <- -1 * Example1_results$Nonbin_SE

Example1_results$Nonbin_Nlosers <- c(
  sum(Nonbin_iter5000_Nwin1_N5_d.2est_d.2act$effect == 0.0),
  sum(Nonbin_iter5000_Nwin1_N10_d.2est_d.2act$effect == 0.0),
  sum(Nonbin_iter5000_Nwin1_N20_d.2est_d.2act$effect == 0.0),
  sum(Nonbin_iter5000_Nwin1_N40_d.2est_d.2act$effect == 0.0),
  sum(Nonbin_iter5000_Nwin1_N80_d.2est_d.2act$effect == 0.0),
  sum(Nonbin_iter5000_Nwin1_N160_d.2est_d.2act$effect == 0.0),
  sum(Nonbin_iter5000_Nwin1_N5_d.2est_d.4act$effect == 0.0),
  sum(Nonbin_iter5000_Nwin1_N10_d.2est_d.4act$effect == 0.0),
  sum(Nonbin_iter5000_Nwin1_N20_d.2est_d.4act$effect == 0.0),
  sum(Nonbin_iter5000_Nwin1_N40_d.2est_d.4act$effect == 0.0),
  sum(Nonbin_iter5000_Nwin1_N80_d.2est_d.4act$effect == 0.0),
  sum(Nonbin_iter5000_Nwin1_N160_d.2est_d.4act$effect == 0.0),
  sum(Nonbin_iter5000_Nwin1_N5_d.2est_d.8act$effect == 0.0),
  sum(Nonbin_iter5000_Nwin1_N10_d.2est_d.8act$effect == 0.0),
  sum(Nonbin_iter5000_Nwin1_N20_d.2est_d.8act$effect == 0.0),
  sum(Nonbin_iter5000_Nwin1_N40_d.2est_d.8act$effect == 0.0),
  sum(Nonbin_iter5000_Nwin1_N80_d.2est_d.8act$effect == 0.0),
  sum(Nonbin_iter5000_Nwin1_N160_d.2est_d.8act$effect == 0.0)
)