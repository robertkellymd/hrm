# Common tools: Functions used in both binary and nonbinary races.
#' 
#' @author Robert Kelly, ORCID 0000-0002-1783-498X
#' @date May 8, 2026
#' @license MIT

#' Finds the new location for the top row of Races, based on its logR value
#' relative to the other rows, whose row numbers are assumed to already be
#' sorted in row_index from high to low logR values for the corresponding rows.
#'
#' @param row_index  A vector of IDs identifying rows in a Race
#' @param Race  The Race data frame for a hypothesis "horse" race in progress
#'
#' @returns  An index for the top row in the Race data frame, by logR value
#'
new_index <- function(row_index, Race) {
  # If logR for row row_index[1] is still the highest, change nothing.
  if (Race$logR[row_index[1]] >= Race$logR[row_index[2]]) {return(1)}
  # Otherwise, the row index needs to be re-inserted into the row_index vector
  # according to its corresponding logR value, to maintain the indices in row_index
  # sorted high to low by corresponding logR value.  Toward that end, we find 
  # the new location for our previous top row index, checking each row in 
  # row_index, starting at the bottom.
  i = length(row_index)  # row whose logR will be compared with Race$logR[row_index[1]]
  while (i >= 2) {  # if i == 2, then the loop will return next line
    if (Race$logR[row_index[1]] <= Race$logR[row_index[i]]) {return(i)}
    i = i - 1
  }
  # This line should never be reached, so a return value is unnecessary.
}

#' Re-sorts the vector of IDs (row numbers) to ensure that the rows of Race 
#' are ordered from highest logR to lowest.
#'
#' @param row_index  A vector of IDs identifying rows in a Race
#' @param Race  The Race data.frame for a hypothesis "horse" race in progress
#'
#' @returns  A vector of IDs ordering rows in a Race from high to low logR
#' 
resort <- function(row_index, Race) {
  i = new_index(row_index, Race)  # gives the new spot in the output vector
  if (i == 1) {return(row_index)} # no need to re-sort if still top logR value
  length_v = length(row_index)
  if (i == length_v) {return(row_index[c(2:length_v, 1)])} # sort to bottom of vector
  return(row_index[c(2:i, 1, (i+1):length_v)])  # else sort to new spot in vector
}
