# Load tidyverse
library(tidyverse)

# Load the blomkvist data and store them in the variable `blomkvist`
blomkvist <- read_csv("data/blomkvist.csv")

# Check out the variables in the data
glimpse(blomkvist)

# Lets go through the essential 3 grammatical elements and apply them to the
# code below:
# 1. Data: map the data blomkvist to `data = `
# 2. Aesthetics: map rt of dominant hand on x and rt of non-dominant hand on y
# Run and check what happens; you should see a blank plot
ggplot(data = ---, mapping = aes(x = ---, y = ---))

# 3. Geometries: let's now visualise the data as points; add `+ geom_point()`
ggplot(data = ---, mapping = aes(x = ---, y = ---))

# Lets add another aethetic. Add sex to colour (everything else as before)
ggplot(data = ---, mapping = aes(x ---, y = ---, colour = ---)) +
  geom_point()

# Map age on size (everything else as before)
ggplot(data = ---, mapping = aes(x = ---, y = ---, size = ---)) +
  geom_point()

# Map age on size and alpha (everything else as before)
ggplot(data = ---, mapping = aes(x = ---, y = ---, size = ---, alpha = ---)) +
  geom_point()

# And add meds_cat as "shape"

# Add another geometry, namely `geom_rug()`

# Geometries control the visual encoding of the data.
# For example, lets look at the frequency distribution of ages in the sample:
# First we create a plotting canvas and save it to an object called "age_plot".
# Map age on x
age_plot <- ggplot(data = blomkvist, mapping = aes(x = age))

# Print the plot by running it's name or typing it in the console.
age_plot
# Not much to see at the moment.

# We can now manipulate this object by adding a geometry layers,
# for example a histogram:
age_plot + geom_histogram()

# You'll see a message like this:
# "`stat_bin()` using `bins = 30`. Pick better value with `binwidth`."
# That means that there are 30 bins in the plot so the age variable was
# divided into 30 bins such that each bin spans over the following
# number of years
(age_range <- range(blomkvist$age)) # age range
(age_range_diff <- diff(age_range)) # age span
age_range_diff/30 # years per bin

# Instead of the number of bins we can use the width of the bins:
# Try a binwidth of 1 (year)
age_plot + geom_histogram(binwidth = ---)

# Change to 5 and then 10 and observe what happens.
age_plot + geom_histogram(binwidth = ---)
age_plot + geom_histogram(binwidth = ---)

# The binwidth argument controls the age span within each bar / bin;
# binwidth = 1 is one year.
# Instead one can use a density plot: add `geom_density()`
age_plot + ---

