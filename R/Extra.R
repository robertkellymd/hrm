#' Here are related functions not needed for the hypothesis race examples
#' 
#' @author Robert Kelly, ORCID 0000-0002-1783-498X
#' @date May 8, 2026
#' @license MIT

#' Calculates nonbinary HRM velocity, i.e., for probability-density ratios
#' 
#' The weighted log-Bayes factor is integrated to give the confirmation distance
#' per trial.
#' 
#' Based on relationship between test value x and t, given by t = x/SE,
#' where SD = 1, so SE = SD/sqrt(N) = 1/sqrt(N) and t = x * sqrt(N).
#' dt(t,df) gives the probability density with respect to t.
#' sqrt(N) * dt(sqrt(N)*x,df) gives the probability density with respect to x;
#' it is necessary to scale by sqrt(N) to maintain area under the curve = 1.
#'
#' @param N  Number of participants in sample
#' @param d  Estimated or actual d-value for alternative hypothesis
#'
#' @returns  The estimated or actual confirmation velocity
#'

Nonbinary_velocity <- function(N, d) {
  df = N - 1
  # For large N, the limits of integration below are used to avoid errors.
  # The integrate() function had problems for infinite intervals as sample sizes 
  # grew large (> ~100).  However, the best limits have not been worked out,
  # and the limits used below might not be optimal.
  a = -(5/sqrt(N))
  b = d+(5/sqrt(N))

  # Weighted log10 of Bayes factor
  WlogBF <- function(x) {
    return(sqrt(N) * dt(sqrt(N)*(d-x),df) *                      # probability density
           log10(dt(sqrt(N)*(d-x),df) / dt(sqrt(N)*(-x),df)))    # log-BF
  }
  
  # Integrates over all x to yield mean WlogBF
  if (N < 100) {
    return(integrate(WlogBF, -Inf, Inf))
  } else {      # For large N, -Inf and Inf are replaced a and b, respectively.
    return(integrate(WlogBF, a, b)[[1]])
  }
}