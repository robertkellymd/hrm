#' Example2
#' 
#' A "horse race" hypothesis race simulation involving 10,000 hypotheses,
#' of which 10 are true, with actual effect sizes as shown below, from d = 0.2
#' to 0.8.  The estimated effect size for this example is d_estimate = 0.2.
#' The sample sizes for each trial are varied from 5 to 160 participants.
#' Binary and nonbinary approaches are compared using 500 iterations for each
#' simulation.
#' 
#' @author Robert Kelly, ORCID 0000-0002-1783-498X
#' @date May 8, 2026
#' @license MIT

source("R/Common_tools.R")
source("R/Binary_tools.R")
source("R/Main_binary.R")
source("R/Nonbinary_tools.R")
source("R/Main_nonbinary.R")

# The list of winner effect sizes is defined here.
effect_sizes <<- c(.8,.4,.4,.2,.2,.2,.2,.2,.2,.2)

# Hyp_race_params data frame contains parameters for the Hypothesis Race simulation.
# Those parameters are:
sampleN_ID <- c(1:6)  # ID to pick out a set of parameters
sampleN <- c(5,10,20,40,80,160)  # sample sizes tried in simulations
d_estimate <- rep(0.2, times = 6)  # Cohen's d estimate for simulations
logRstart <- rep(-3, times = 6)  # Starting log10(R-value) for all hypotheses 
logRfinish <- rep(2, times = 6)  # Target value at which a winner is declared.
Nwin_target <- rep(5, times = 6)  # Number of winning hypotheses to be selected.
Nhyp <- rep(10000, times = 6)  # Total number of hypotheses in each race.
Niterations <- rep(500, times = 6)  # Number of races to run for simulation.

Hyp_race_params <<- data.frame(sampleN_ID,
                               sampleN,
                               d_estimate,
                               logRstart,
                               logRfinish,
                               Nwin_target,
                               Nhyp,
                               Niterations)

time_stats <- system.time({Iter_500_bin_Nwin_5_size_160_test = run_Races_binary(6)})
print(time_stats)
time_stats <- system.time({Iter_500_bin_Nwin_5_size_80_test = run_Races_binary(5)})
print(time_stats)
time_stats <- system.time({Iter_500_bin_Nwin_5_size_40_test = run_Races_binary(4)})
print(time_stats)
time_stats <- system.time({Iter_500_bin_Nwin_5_size_20_test = run_Races_binary(3)})
print(time_stats)
time_stats <- system.time({Iter_500_bin_Nwin_5_size_10_test = run_Races_binary(2)})
print(time_stats)
time_stats <- system.time({Iter_500_bin_Nwin_5_size_5_test = run_Races_binary(1)})
print(time_stats)

time_stats <- system.time({Iter_500_nonbin_Nwin_5_size_160_test = run_Races_nonbinary(6)})
print(time_stats)
time_stats <- system.time({Iter_500_nonbin_Nwin_5_size_80_test = run_Races_nonbinary(5)})
print(time_stats)
time_stats <- system.time({Iter_500_nonbin_Nwin_5_size_40_test = run_Races_nonbinary(4)})
print(time_stats)
time_stats <- system.time({Iter_500_nonbin_Nwin_5_size_20_test = run_Races_nonbinary(3)})
print(time_stats)
time_stats <- system.time({Iter_500_nonbin_Nwin_5_size_10_test = run_Races_nonbinary(2)})
print(time_stats)
time_stats <- system.time({Iter_500_nonbin_Nwin_5_size_5_test = run_Races_nonbinary(1)})
print(time_stats)