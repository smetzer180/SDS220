#-------------------------------------------------------------------------------
# Setup
#-------------------------------------------------------------------------------
library(tidyverse)

# Population of heights
population_heights <- read_csv("https://goo.gl/3gsSwx")
View(population_heights)

# The population mean mu. What we will pretend we don't know. Equals 164.3cm.
mu <- population_heights %>%
  summarize(sample_mean = mean(height))
mu

# Painstakingly taken single sample of size n = 10
sampled_heights <- read_csv("https://goo.gl/MB9tCo")
View(sampled_heights)

# The sample mean x-bar, our point estimate of mu, which are pretending to not
# know.
x_bar <- sampled_heights %>%
  summarize(sample_mean = mean(height))
x_bar

# Question: Estimating mu with a point estimate is like trying to catch a fish
# with a spear. What if we want to try to catch a fish with a net? i.e. a range
# values.
#
# Answer: Let's first construct the boostrap distribution by resampling with
# replacement from our single sample using the infer package, then construct a
# confidence interval!


#-------------------------------------------------------------------------------
# Setup
#-------------------------------------------------------------------------------
library(infer)

# Step 1: Specify variable of interest. Only changes meta-data, not actual data
sampled_heights %>%
  specify(response = height)

# Step 2: Generate 1000 replicates of resamples with replacment of size n = 10
sampled_heights %>%
  specify(response = height) %>%
  generate(reps = 1000)

# Step 3: For each replicate, calculate the sample mean. This is our
# bootstrap distribution of x-bar, which is an approxmation to the sampling
# distribution of x-bar
bootstrap_distribution <- sampled_heights %>%
  specify(response = height) %>%
  generate(reps = 1000) %>%
  calculate(stat = "mean")
View(bootstrap_distribution)

# Step 4.a): Visualize the boostrap distribution
bootstrap_distribution %>%
  visualize()

# Note this is a shortcut to typing the full ggplot2 statement!
ggplot(bootstrap_distribution, aes(x = stat)) +
  geom_histogram(bins = 15, color = "white")

# Step 4.b): Visualize the boostrap distribution + observed x_bar
sampled_heights %>%
  specify(response = height) %>%
  generate(reps = 1000) %>%
  calculate(stat = "mean") %>%
  visualize(obs_stat = x_bar)


#-------------------------------------------------------------------------------
# Confidence Intervals: Two types
#-------------------------------------------------------------------------------
# Type 1: Percentile confidence interval. What are the middle 95% of values?
percentile_conf_int <- bootstrap_distribution %>%
  get_ci(level = 0.95, type = "percentile")
percentile_conf_int

# Type 1 Visualization
bootstrap_distribution %>%
  visualize(endpoints = percentile_conf_int, direction = "between")

# Type 2: Standard error confidence interval. Since the boostrap distribution
# is normally shaped with:
# 1. Center xbar
# 2. Standard deviation called the standard error
standard_error_conf_int <- bootstrap_distribution %>%
  get_ci(type = "se", point_estimate = x_bar)

# Type 2: Visualization
bootstrap_distribution %>%
  visualize(endpoints = standard_error_conf_int, direction = "between")

# Type 2: Computing manually
bootstrap_distribution %>%
  summarize(center = mean(stat), SE = sd(stat))

c(64.1 - 1.96 * 0.730, 64.1 + 1.96 * 0.730)
