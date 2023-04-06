# Load tidyverse package (which includes ggplot2 and many other useful
# functions for data processing).
# If you haven't installed tidyverse, uncomment and run this line:
# install.packages("tidyverse")
library(tidyverse)

# Load the data
blomkvist <- read_csv("data/blomkvist.csv")

# Explore the data blomkvist with glimpse()
glimpse(---) # replace "---"

# Make sure you have an idea of the variable names in the data.
# Eg, what could rt_hand_d mean (vs rt_foot_nd)?
# Hint: "_d" is for dominant, "_nd" is for non-dominant.

# Map rt of the dominant hand on the x-axis and rt of the non-dominand
# hand on the y-axis
ggplot(data = blomkvist, mapping = aes(x = ---, y = ---)) +
  geom_point()

# There are some participants with more extreme values.
# Let's see who are those individuals.
# 1. Map rt of dominant hand on the x-axis and rt of non-dominant hand
# on the y-axis (as before).
# 2. Map id on label.
# 3. Replace geom_point() with geom_text() or geom_label().
ggplot(data = blomkvist, mapping = aes(x = ---, y = ---, label = ---)) +
  geom_point()

# It's hard to see the participants on the lower end.
# Use the logarithm for both axis to increase the distance between values
# on the lower end of the scale.
# 1. x and y as previously.
# 2. I've already added scale_y_log10() to log transform the y-axis.
# Do the same for the x-axis.
ggplot(data = blomkvist, mapping = aes(x = ---, y = ---)) +
  geom_point() +
  scale_y_log10() +
  ---

# Replace the points with text or labels (see above).

# Copy the previous code and add a linear model to it, i.e.:
# + stat_smooth(method = "lm")
