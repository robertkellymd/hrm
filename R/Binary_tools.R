#' Binary tools
#' 
#' Script to support binary hypothesis races, i.e., the evaluation of
#' results from trials whose outcomes are considered positive or negative,
#' "statistically significant" or not.
#' 
#' @author Robert Kelly, ORCID 0000-0002-1783-498X
#' @date May 8, 2026
#' @license MIT

#' Finds beta value, given alpha-level for hypothesis testing with t-test.
#' 
#' Based on relationship between test value x and t, given by t = x/SE,
#' where SD = 1, so SE = SD/sqrt(N) = 1/sqrt(N) and t = x * sqrt(N).
#'
#' @param alpha  alpha-level for hypothesis testing
#' @param N  Number of participants in sample
#' @param d  Estimated or actual d-value for alternative hypothesis
#'
#' @returns beta, the probability of type II error
#'
alpha_to_beta <- function(alpha, N, d) {
  df = N - 1
  t = -qt(alpha, df)  # standardized t-score corresponding to alpha level
  x = t/sqrt(N)  # corresponding x-value with SE = 1/sqrt(N)
  beta = 1 - pt(sqrt(N)*(d-x), df)  # 1 - power
  return(beta)
}  

#' Provides the maximum confirmation velocity achievable for a given actual 
#' alpha level, sample size (N), and actual Cohen's d.  This velocity only
#' occurs when the estimates for alpha and d are identical to their 
#' actual values, so actual values and estimates are both referred to as
#' alpha and d, respectively.
#'
#' @param alpha  actual alpha level
#' @param N  sample size
#' @param d  actual Cohen's d-value, with an assumed standard deviation = 1.
#'
#' @returns  The maximum confirmation velocity possible with these parameters.
#'
Velocity <- function(alpha, N, d) {
  df = N - 1
  beta = alpha_to_beta(alpha, N, d)  # same beta for actual and estimated
  # The estimated Bayesian Factor (BF) per trial 
  BF_pos = log10((1 - beta)/alpha)  # for positive outcomes
  BF_neg = log10(beta/(1 - alpha))  # for negative outcomes
  # The estimated BF per trial is weighted with the actual beta values
  WBF_pos = (1 - beta)*log10((1 - beta)/alpha)  # average for positive trials
  WBF_neg = beta*log10(beta/(1 - alpha))  # average for negative trials
  return(WBF_pos + WBF_neg)  # returns mean confirmation velocity
}

#' Finds the maximum confirmation velocity possible for a given sample size
#' and the actual Cohen's d for the hypothesis.  Also found are the
#' alpha level and corresponding power where this occurs.  Here it is assumed
#' that the estimated values for alpha and d happen to match actual values,
#' which is a necessary condition for maximum velocity to occur.  The point
#' here is that maximum velocity is found at a single value of alpha, so it is
#' important to set up our statistical model so that the estimated value of alpha
#' is chosen to maximize confirmation velocity.  This function finds that value.
#' 
#' The algorithm below assumes that if we start from a high value of alpha,
#' say 0.9, the confirmation velocity as a function of alpha will increase
#' monotonically as alpha decreases, until a maximum velocity is reached, and
#' thereafter decrease monotonically.
#'
#' @param N  sample size for each trial
#' @param d  Cohen's d, actual and estimated, assumed to be equal.
#' @param sig_fig  Number of significant figures in alpha value.
#'
#' @returns N, d, alpha, power, maximum average confirmation velocity
#'
Velocity_max <- function(N, d, sig_fig) {
  alpha = 0.9   # start value irrelevant as long as higher than optimal alpha
  delta = -0.1  # starting to decrement by 0.1 in search for optimal alpha
  V = Velocity(alpha, N, d)  # find velocity given parameters
  
  # The following if-statement is a kluge designed to make the script work
  # in some cases where high N and d cause Velocity to be undefined, because
  # the beta value corresponding to alpha becomes rounded to zero, which we 
  # cannot use with log.  The fix below sets alpha and delta to lower values 
  # and reevaluates V.
  if(is.nan(V)) {
    alpha = 0.1
    delta = -0.01
    V = Velocity(alpha, N, d)  # find velocity again with smaller alpha
  }
  
  alpha = alpha + delta  # try new alpha larger (or smaller) by delta
  New_V = Velocity(alpha, N, d)  # find its corresponding velocity
  # Outer loop to search for maximum velocity and associated alpha
  while (sig_fig > 0) {  # stop when number of significant figures sufficient
    # Inner loop continues until the New_V is no longer higher than V
    while (New_V > V) {
      V = New_V
      # alpha never passes zero, by reducing delta at 0.1, 0.01, 0.001, etc.
      epsilon <- 1E-10  # picking slightly high epsilon to ensure next line works.
      if(abs(round(log10(alpha)) - log10(alpha)) < epsilon) {delta = delta/10}
      alpha = alpha + delta
      New_V = Velocity(alpha, N, d)
    }
    # Flow continues here after a transition from ascending to descending values,
    # (i.e., New_V < V)
    sig_fig = sig_fig - 1  # decrements significant figure counter
    # The next line terminates the outer loop, making V the maximum velocity.
    if(sig_fig == 0) break  # if zero then we have enough sig figs.
    
    # Otherwise, we continue the search for max velocity and associated alpha,
    # changing directions with smaller delta, starting with the previous New_V.
    V = New_V
    delta = delta/-10  # refines the search to the next sig fig.
    alpha = alpha + delta
    New_V = Velocity(alpha, N, d) # Initialization for outer loop again
  }
  # Here the value of alpha that maximizes V has been found to desired precision 
  alpha_max = alpha - delta  #  The value of alpha corresponding to V
  beta = alpha_to_beta(alpha_max, N, d)  # gets the corresponding beta
  return(c(N,d,alpha_max,1-beta,V))
}
