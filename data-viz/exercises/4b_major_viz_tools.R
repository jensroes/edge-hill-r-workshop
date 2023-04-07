# Load tidyverse
library(tidyverse)

# Comparing boxplots and dynamite plots for medicine

# Load the blomkvist data and store them in the variable `blomkvist`
blomkvist <- read_csv("data/blomkvist.csv")

# Check out the variables in the data
glimpse(blomkvist)

# Let's start by creating a canvas for the data with rt of dominant hand on
# y axis and meds_cat on x axis.
p_meds <- ggplot(data = blomkvist, aes(y = ---, x = ---))

# Check out the plot so far:
p_meds

# Dynamite plots are frequently used to compare groups although there are
# good reasons to avoid these.

# For practice here is how to create a dynamite plot.

# stat_summary allows us to calculate summary statistics such as the mean and
# error bars.

# Check the following code. Medians are plotted as point.
p_meds + stat_summary(fun = median, geom = "point", fill = "grey")

# Try instead to represent the mean as "bar" geom:
p_meds + stat_summary(fun = ---, geom = "---", fill = "grey")
# HINT: change median to mean and point to bar.

# Repeat the above for the first stat_summary function below.
# The second stat_summary() should add the geom "errorbar"s.
# Set width to 0.5.
p_meds + stat_summary(fun = ---, geom = "---", fill = "grey") +
         stat_summary(fun.data = mean_sdl, geom = "---", width = ---)

# What's the problem with dynamite plots?
# 1. we don't know how the data are distributed (plot suggest normal),
# 2. how many observation do we have in each group?
# 3. bars suggest data where there are none (e.g. zero rt).
# 4. there are values above the bar that are not shown in ink.
# Overall, dynamite plots conceal and distort information more than they reveal.
# Don't bother with dynamite plots :)
# Also, the alternatives are much easier to create :)

# Here are some alternatives equivalent to what you have done in the previous script:
# Add them to the canvas p_meds
--- + geom_point()
--- + geom_jitter(width = .1)
--- + geom_violin(draw_quantiles = c(.025,.5,.975), trim = F) # matter of taste ;)
--- + geom_boxplot(width = .25)

# For boxplots you can change the colour attribute of outliers. Try red.
--- + geom_boxplot(width = .25, outlier.colour = "---")

# You can add notches which represent 95% confidence intervals.
# Set notch to TRUE (FALSE is default)
--- + geom_boxplot(width = .25, notch = ---)

# The middle line shows the median. You can add the mean though.
# Set fun to mean, geom to point and display the means in red.
p_meds + geom_boxplot(width = .25) +
  stat_summary(fun = ---, geom = "---", colour = "---")

# Add jittered data points to a boxplot.
p_meds +
  geom_---(width = .15) + # jittered points here
  geom_---(width = .25, outlier.shape = NA, notch = TRUE) # boxplot here

# Note: outlier.shape = NA removes "outliers" because we want to add the
# raw data as jittered data points.

# Consider this plot:
p_meds +
  geom_jitter(width = .1) +
  stat_summary(fun = mean, geom = "point", size = 5, colour = "darkred") +
  stat_summary(fun.data = mean_sdl,
               geom = "errorbar",
               colour = "darkred",
               width = .25)

# Task:
# The errorbars in the plot indicate 2 times SD
# Instead you might want to use confidence intervals.
# For CIs use the function mean_cl_normal instead of mean_sdl
# Beautiful :)
