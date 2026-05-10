#' Example1
#' 
#' A "horse race" hypothesis race simulation involving 1000 hypotheses,
#' of which only one is true, with estimated effect size of d = 0.8, followed by
#' d = 0.4, then 0.2.  The actual effect size for the winning hypothesis for this
#' example is d_estimate = 0.2, 0.4, or 0.8.  The sample sizes for each trial
#' are varied from 5 to 160 participants.  Binary and nonbinary approaches are 
#' compared using 5000 iterations for each simulation.
#' 
#' @author Robert Kelly, ORCID 0000-0002-1783-498X
#' @date May 8, 2026
#' @license MIT

source("R/Common_tools.R")
source("R/Binary_tools.R")
source("R/Main_binary.R")
source("R/Nonbinary_tools.R")
source("R/Main_nonbinary.R")

# Hyp_race_params data frame contains parameters for the Hypothesis Race simulation.
# Those parameters are:
sampleN_ID <- c(1:18)  # ID to pick out a set of parameters
sampleN <- c(5,10,20,40,80,160)  # sample sizes tried in simulations
d_estimate <- c(rep(0.2, times = 6),
                rep(0.4, times = 6),
                rep(0.8, times = 6))  # Cohen's d estimate for simulations
logRstart <- -3  # Starting log10(R-value) for all hypotheses 
logRfinish <- 2  # Target value at which a winner is declared.
Nwin_target <- 1  # Number of winning hypotheses to be selected.
Nhyp <- 1000  # Total number of hypotheses in each race.
Niterations <- 5000  # Number of races to run for simulation.

Hyp_race_params <<- data.frame(sampleN_ID,
                               sampleN,
                               d_estimate,
                               logRstart,
                               logRfinish,
                               Nwin_target,
                               Nhyp,
                               Niterations)

# Now we run a total of 72 simulations, where we use the binary and nonbinary
# approaches to find winning hypotheses while varying the sample size for
# each trial (sampleN), the estimated Cohen's d (d_estimate), and the actual
# Cohen's d for the winning hypothesis (effect_sizes, which in this example
# only gives the value for a single winning hypothesis).

# The first set, with 36 simulations, uses d_actual = 0.8.
effect_sizes <<- c(.8)

# Skipping the d=0.8, N=160 case because alpha becomes too small and leads to
# the script crashing.
#time_stats <- system.time({Bin_iter5000_Nwin1_N160_d.8est_d.8act = run_Races_binary(18)})
#print(time_stats)
time_stats <- system.time({Bin_iter5000_Nwin1_N80_d.8est_d.8act = run_Races_binary(17)})
print(time_stats)
time_stats <- system.time({Bin_iter5000_Nwin1_N40_d.8est_d.8act = run_Races_binary(16)})
print(time_stats)
time_stats <- system.time({Bin_iter5000_Nwin1_N20_d.8est_d.8act = run_Races_binary(15)})
print(time_stats)
time_stats <- system.time({Bin_iter5000_Nwin1_N10_d.8est_d.8act = run_Races_binary(14)})
print(time_stats)
time_stats <- system.time({Bin_iter5000_Nwin1_N5_d.8est_d.8act = run_Races_binary(13)})
print(time_stats)
time_stats <- system.time({Bin_iter5000_Nwin1_N160_d.4est_d.8act = run_Races_binary(12)})
print(time_stats)
time_stats <- system.time({Bin_iter5000_Nwin1_N80_d.4est_d.8act = run_Races_binary(11)})
print(time_stats)
time_stats <- system.time({Bin_iter5000_Nwin1_N40_d.4est_d.8act = run_Races_binary(10)})
print(time_stats)
time_stats <- system.time({Bin_iter5000_Nwin1_N20_d.4est_d.8act = run_Races_binary(9)})
print(time_stats)
time_stats <- system.time({Bin_iter5000_Nwin1_N10_d.4est_d.8act = run_Races_binary(8)})
print(time_stats)
time_stats <- system.time({Bin_iter5000_Nwin1_N5_d.4est_d.8act = run_Races_binary(7)})
print(time_stats)
time_stats <- system.time({Bin_iter5000_Nwin1_N160_d.2est_d.8act = run_Races_binary(6)})
print(time_stats)
time_stats <- system.time({Bin_iter5000_Nwin1_N80_d.2est_d.8act = run_Races_binary(5)})
print(time_stats)
time_stats <- system.time({Bin_iter5000_Nwin1_N40_d.2est_d.8act = run_Races_binary(4)})
print(time_stats)
time_stats <- system.time({Bin_iter5000_Nwin1_N20_d.2est_d.8act = run_Races_binary(3)})
print(time_stats)
time_stats <- system.time({Bin_iter5000_Nwin1_N10_d.2est_d.8act = run_Races_binary(2)})
print(time_stats)
time_stats <- system.time({Bin_iter5000_Nwin1_N5_d.2est_d.8act = run_Races_binary(1)})
print(time_stats)

time_stats <- system.time({Nonbin_iter5000_Nwin1_N160_d.8est_d.8act = run_Races_nonbinary(18)})
print(time_stats)
time_stats <- system.time({Nonbin_iter5000_Nwin1_N80_d.8est_d.8act = run_Races_nonbinary(17)})
print(time_stats)
time_stats <- system.time({Nonbin_iter5000_Nwin1_N40_d.8est_d.8act = run_Races_nonbinary(16)})
print(time_stats)
time_stats <- system.time({Nonbin_iter5000_Nwin1_N20_d.8est_d.8act = run_Races_nonbinary(15)})
print(time_stats)
time_stats <- system.time({Nonbin_iter5000_Nwin1_N10_d.8est_d.8act = run_Races_nonbinary(14)})
print(time_stats)
time_stats <- system.time({Nonbin_iter5000_Nwin1_N5_d.8est_d.8act = run_Races_nonbinary(13)})
print(time_stats)
time_stats <- system.time({Nonbin_iter5000_Nwin1_N160_d.4est_d.8act = run_Races_nonbinary(12)})
print(time_stats)
time_stats <- system.time({Nonbin_iter5000_Nwin1_N80_d.4est_d.8act = run_Races_nonbinary(11)})
print(time_stats)
time_stats <- system.time({Nonbin_iter5000_Nwin1_N40_d.4est_d.8act = run_Races_nonbinary(10)})
print(time_stats)
time_stats <- system.time({Nonbin_iter5000_Nwin1_N20_d.4est_d.8act = run_Races_nonbinary(9)})
print(time_stats)
time_stats <- system.time({Nonbin_iter5000_Nwin1_N10_d.4est_d.8act = run_Races_nonbinary(8)})
print(time_stats)
time_stats <- system.time({Nonbin_iter5000_Nwin1_N5_d.4est_d.8act = run_Races_nonbinary(7)})
print(time_stats)
time_stats <- system.time({Nonbin_iter5000_Nwin1_N160_d.2est_d.8act = run_Races_nonbinary(6)})
print(time_stats)
time_stats <- system.time({Nonbin_iter5000_Nwin1_N80_d.2est_d.8act = run_Races_nonbinary(5)})
print(time_stats)
time_stats <- system.time({Nonbin_iter5000_Nwin1_N40_d.2est_d.8act = run_Races_nonbinary(4)})
print(time_stats)
time_stats <- system.time({Nonbin_iter5000_Nwin1_N20_d.2est_d.8act = run_Races_nonbinary(3)})
print(time_stats)
time_stats <- system.time({Nonbin_iter5000_Nwin1_N10_d.2est_d.8act = run_Races_nonbinary(2)})
print(time_stats)
time_stats <- system.time({Nonbin_iter5000_Nwin1_N5_d.2est_d.8act = run_Races_nonbinary(1)})
print(time_stats)


# The second set uses d_actual = 0.4.  Only 24 simulations are needed because
# d_estimate = 0.8, a higher value than d_actual could lead to disconfirmation
# rather than confirmation of the seeded true hypothesis.
effect_sizes <<- c(.4)

time_stats <- system.time({Bin_iter5000_Nwin1_N160_d.4est_d.4act = run_Races_binary(12)})
print(time_stats)
time_stats <- system.time({Bin_iter5000_Nwin1_N80_d.4est_d.4act = run_Races_binary(11)})
print(time_stats)
time_stats <- system.time({Bin_iter5000_Nwin1_N40_d.4est_d.4act = run_Races_binary(10)})
print(time_stats)
time_stats <- system.time({Bin_iter5000_Nwin1_N20_d.4est_d.4act = run_Races_binary(9)})
print(time_stats)
time_stats <- system.time({Bin_iter5000_Nwin1_N10_d.4est_d.4act = run_Races_binary(8)})
print(time_stats)
time_stats <- system.time({Bin_iter5000_Nwin1_N5_d.4est_d.4act = run_Races_binary(7)})
print(time_stats)
time_stats <- system.time({Bin_iter5000_Nwin1_N160_d.2est_d.4act = run_Races_binary(6)})
print(time_stats)
time_stats <- system.time({Bin_iter5000_Nwin1_N80_d.2est_d.4act = run_Races_binary(5)})
print(time_stats)
time_stats <- system.time({Bin_iter5000_Nwin1_N40_d.2est_d.4act = run_Races_binary(4)})
print(time_stats)
time_stats <- system.time({Bin_iter5000_Nwin1_N20_d.2est_d.4act = run_Races_binary(3)})
print(time_stats)
time_stats <- system.time({Bin_iter5000_Nwin1_N10_d.2est_d.4act = run_Races_binary(2)})
print(time_stats)
time_stats <- system.time({Bin_iter5000_Nwin1_N5_d.2est_d.4act = run_Races_binary(1)})
print(time_stats)

time_stats <- system.time({Nonbin_iter5000_Nwin1_N160_d.4est_d.4act = run_Races_nonbinary(12)})
print(time_stats)
time_stats <- system.time({Nonbin_iter5000_Nwin1_N80_d.4est_d.4act = run_Races_nonbinary(11)})
print(time_stats)
time_stats <- system.time({Nonbin_iter5000_Nwin1_N40_d.4est_d.4act = run_Races_nonbinary(10)})
print(time_stats)
time_stats <- system.time({Nonbin_iter5000_Nwin1_N20_d.4est_d.4act = run_Races_nonbinary(9)})
print(time_stats)
time_stats <- system.time({Nonbin_iter5000_Nwin1_N10_d.4est_d.4act = run_Races_nonbinary(8)})
print(time_stats)
time_stats <- system.time({Nonbin_iter5000_Nwin1_N5_d.4est_d.4act = run_Races_nonbinary(7)})
print(time_stats)
time_stats <- system.time({Nonbin_iter5000_Nwin1_N160_d.2est_d.4act = run_Races_nonbinary(6)})
print(time_stats)
time_stats <- system.time({Nonbin_iter5000_Nwin1_N80_d.2est_d.4act = run_Races_nonbinary(5)})
print(time_stats)
time_stats <- system.time({Nonbin_iter5000_Nwin1_N40_d.2est_d.4act = run_Races_nonbinary(4)})
print(time_stats)
time_stats <- system.time({Nonbin_iter5000_Nwin1_N20_d.2est_d.4act = run_Races_nonbinary(3)})
print(time_stats)
time_stats <- system.time({Nonbin_iter5000_Nwin1_N10_d.2est_d.4act = run_Races_nonbinary(2)})
print(time_stats)
time_stats <- system.time({Nonbin_iter5000_Nwin1_N5_d.2est_d.4act = run_Races_nonbinary(1)})
print(time_stats)


# The third set uses d_actual = 0.2.  Only 12 simulations are needed because for
# d_estimate = 0.4 or 0.8, higher values than d_actual could lead to disconfirmation
# rather than confirmation of the seeded true hypothesis.
effect_sizes <<- c(.2)

time_stats <- system.time({Bin_iter5000_Nwin1_N160_d.2est_d.2act = run_Races_binary(6)})
print(time_stats)
time_stats <- system.time({Bin_iter5000_Nwin1_N80_d.2est_d.2act = run_Races_binary(5)})
print(time_stats)
time_stats <- system.time({Bin_iter5000_Nwin1_N40_d.2est_d.2act = run_Races_binary(4)})
print(time_stats)
time_stats <- system.time({Bin_iter5000_Nwin1_N20_d.2est_d.2act = run_Races_binary(3)})
print(time_stats)
time_stats <- system.time({Bin_iter5000_Nwin1_N10_d.2est_d.2act = run_Races_binary(2)})
print(time_stats)
time_stats <- system.time({Bin_iter5000_Nwin1_N5_d.2est_d.2act = run_Races_binary(1)})
print(time_stats)

time_stats <- system.time({Nonbin_iter5000_Nwin1_N160_d.2est_d.2act = run_Races_nonbinary(6)})
print(time_stats)
time_stats <- system.time({Nonbin_iter5000_Nwin1_N80_d.2est_d.2act = run_Races_nonbinary(5)})
print(time_stats)
time_stats <- system.time({Nonbin_iter5000_Nwin1_N40_d.2est_d.2act = run_Races_nonbinary(4)})
print(time_stats)
time_stats <- system.time({Nonbin_iter5000_Nwin1_N20_d.2est_d.2act = run_Races_nonbinary(3)})
print(time_stats)
time_stats <- system.time({Nonbin_iter5000_Nwin1_N10_d.2est_d.2act = run_Races_nonbinary(2)})
print(time_stats)
time_stats <- system.time({Nonbin_iter5000_Nwin1_N5_d.2est_d.2act = run_Races_nonbinary(1)})
print(time_stats)