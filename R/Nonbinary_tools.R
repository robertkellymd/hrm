#' Nonbinary tools
#' 
#' Tools to support nonbinary hypothesis races, i.e. races where p-values
#' from t-tests are used to determine Bayesian factors based on probability
#' densities rather than based on positive (statistically significant) vs.
#' negative (nonsignificant) outcomes.
#' 
#' @author Robert Kelly, ORCID 0000-0002-1783-498X
#' @date May 8, 2026
#' @license MIT

#' Calculates logBF using the ratio of the probability densities for the
#' alternative and null hypotheses based on the random outcome of a single trial.
#'
#' @param spec_ID  The ID for specifications in a row of Hyp_race_params
#' @param d_actual  The actual d-value for the hypothesis in question
#'
#' @returns  log10(BF), where BF is the Bayesian factor for the trial outcome
#'
log_prob_ratio <- function(spec_ID, d_actual) {
  # Fetch values for N, df, and d_estimate from Hyp_race_params
  N = Hyp_race_params$sampleN[spec_ID]
  df = N - 1
  d_estimate = Hyp_race_params$d_estimate[spec_ID]
  # A trial yields a random difference of means having a t-distribution centered
  # on the value corresponding to the actual effect size.  We begin with the
  # t-value corresponding to this random difference.
  t_actual = qt(runif(1), df) # left-tailed cumulative t-distribution, random value
  # This t-score is translated to the t-score for the alternative hypothesis
  # based on its corresponding estimated d-value, which in consideration of
  # the relationship t = x/SE, where with SD = 1, SE = 1/sqrt(N) and x = d, 
  # simplifies to
  t_alt = t_actual + sqrt(N)*(d_actual - d_estimate)
  # Ditto for the null hypothesis, yielding its t-value corresponding to the
  # random result of the trial.
  t_null = t_actual + sqrt(N)*d_actual
  # Returns log10 of the ratio of the probability densities corresponding to 
  # these t-values
  return(log10(dt(t_alt, df)/dt(t_null, df)))
}
