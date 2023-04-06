# Load tidyverse package
library(tidyverse)
library(ggthemes)
# If not installed, install ggthemes
#install.packages("ggthemes")

# Load the blomkvist data and store them in the variable `blomkvist`
blomkvist <- read_csv("data/blomkvist.csv")

# Check out the variables in the data
glimpse(blomkvist)

# We're going to compare rts from dominant / non-dominant hand / foot.
# A wide data format is useful for plotting bivariate distributions:
# Plot 1
ggplot(blomkvist, aes(y = rt_hand_d, x = rt_hand_nd)) +
  geom_point()

# Plot 2
ggplot(blomkvist, aes(y = rt_hand_d, x = ---)) + #  use "age" for x-axis
  geom_point()

# It is also useful for comparing rts of the dominant hand of smokers / non-smokers
# Plot 3
ggplot(blomkvist, aes(y = rt_hand_nd, x = ---)) + # use "smoker" for x-axis
  geom_point(position = position_jitter(width = ---)) # change width of jitter to .25

# Also as boxplots ...
# Plot 4
ggplot(blomkvist, aes(y = rt_hand_nd, x = ---)) + # use "smoker" for x-axis
  geom_point(position = position_jitter(width = ---)) +  # change width of jitter to .25
  geom_---(width = .25, outlier.shape = NA) #  we want a "boxplot" here

# But maybe you want to compare dominant / non-dominant hand / foot, all in one plot.
# There are various hacks of achieving this but if you want to do it tidy,
# you need a long data format.

# Some data transformation. We can ignore the details for now ...
blomkvist_long <- pivot_longer(blomkvist,
                               cols = starts_with("rt_"),
                               names_to = c(".value", "response_by", "dominant"),
                               names_sep = "_")

# ... but check out how the data have changed:
glimpse(blomkvist_long)

# A long format allows us to produce the same plots as above (except for plot 1)
# and more.

# Fill in the --- so the code is producing a scatter plot with age on the x axis
# and rt on the y axis.
# include "response_by" as aesthetic. Choose wisely.
ggplot(blomkvist_long, aes(y = rt, x = age, --- = response_by)) +
  geom_point()

# There is a trend in the data that older participants tend to be slower
# but the variance in the data is also larger for older participants (>70 years).

# To reduce the distance to larger values and thus to reduce the equality of variance,
# lets use the log of the y axis using `+ scale_y_log10()`
ggplot(blomkvist_long, aes(y = rt, x = age, --- = response_by)) +
  geom_point() +
  --- # log scale y axis

# Lets see if smokers have different rt changes across lifespan than non-smokers.
ggplot(blomkvist_long, aes(y = rt, x = age, colour = ---)) + # map "smoker" to colour
  geom_point() +
  --- # log scale y axis

# There is no obvious pattern. We see though that smoker has missing values (NA) we should get rid off.
blomkvist_long <- filter(blomkvist_long, !is.na(---)) # replace --- with "smoker"

# Then, let's add regression lines for each level of smoker using stat_smooth.
# Such a plot corresponds to a model of the type ANCOVA.
ggplot(blomkvist_long, aes(y = rt, x = age, colour = ---)) + # map "smoker" to colour
  geom_point(alpha = ---) + # reduce opacity to .25 of the points
  --- + # log scale y axis
  stat_smooth(method = "---") # we want the method to "lm" (linear model)

# We're observing a slowdown for older participants for all levels of smoker.
# The regression lines don't really capture the exponential trend in the dots. We can change that
# using the formula option for `stat_smooth`
ggplot(blomkvist_long, aes(y = rt, x = age, colour = ---)) + # map "smoker" to colour
  geom_point(alpha = ---) + # reduce opacity to .25 of the points
  --- + # log scale y axis
  stat_smooth(method = "---", formula = y ~ poly(x, 1)) # we want the method to "lm" (linear model)

# `y ~ poly(x, 1)` is equivalent to `y ~ x`, so y (rts) is a linear function of x (age).
# `poly(x, 1)` is a first order orthogonal polynomial. It's not to important here what
# orthogonal polynomial means but it allows us to fit models that are not a straight line.
# poly(x, 2) would be a quadratic model such as x + x^2, so a model with one curve,
# or poly(x, 3) would be a cubic model equivalent to x + x^2 + x^3, so a model with two curves per line.
# Task: change the last code above to add a quadratic model instead of a linear model.

# Task: lets keep working on that plot you just created. We want to see whether
# the curves we just fitted reproduce for dominant / nondominant hand / foot.
# We will use `+ facet_wrap( ~ )` for that.
# Remind yourself of the variable name that allows you to distinguish between hand and
# foot responses.
glimpse(blomkvist_long)
# Then insert the name in here `+ facet_wrap(~ ---)` and add it to the latest plot.

# Task: in addition to hand / foot responses, lets add dominant / nondominant response.
# You can do this using a `+` in `+ facet_wrap(~ --- + ---)`.
# Insert the variable names for hand / foot and dominant / nondominant (check `glimpse` above
# if necessary).

# Continue with Exercise 5b
