# hrm
Hypothesis Race Model toolbox

#' @author Robert Kelly, ORCID 0000-0002-1783-498X
#' @date May 9, 2026
#' @license MIT

This project contains R-functions to allow Monte Carlo simulation of
the Horse Race Variant of the Hypothesis Race Model, where many hypotheses
are tested in parallel to find the true hypotheses.  Key parameters
for this simulation are 1) the effect sizes for the true hypotheses,
with false hypotheses assumed to have zero effect size; 2) the number of
participants in each sample, assuming a fixed sample size for all trials;
and 3) the estimated effect size to be used with the Hypothesis Race Model
for evaluating the progress of each hypothesis in the testing simulation.

The point of the Horse Race Variant approach is that by focusing testing
on the most promising hypotheses as the results from the first trials
become known, it may be possible to save research resources by reducing the
total number of participants necessary to find the true hypotheses among a
large number of false hypotheses.

By running many iterations ("races"), whose outcomes are determined by chance,
it is possible to estimate the range and average number of trials required
to find the true hypotheses.  By comparing the average number of 
participants required for each sample size it is possible to determine
an optimal sample size range to test hypotheses with given actual effect sizes
and estimated effect sizes for the Hypothesis Race Model.  It is also a means
of assessing how often false hypotheses might incorrectly be confirmed.

In case of package compatibility issues, consider running source("renv/activate.R").
This command had been in the .Rprofile file, which had to be removed because of
compatibility issues in testing the project on a Windows 10-based version of
R and Rstudio.