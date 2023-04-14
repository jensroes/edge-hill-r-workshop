# Load libraries
library(tidyverse)

# Import data as tibble
blomkvist <- read_csv("data/blomkvist.csv")

# Select id, smoker, age, medicine dosage (`meds_cat`),
# and rt of dominant hand renamed as rt
blomkvist <- select(blomkvist, ---)

# Remove rts larger than 1.5 secs and missing rts (NAs)
blomkvist_filtered <- filter(blomkvist, ---)

# Add the sample mean and a variable that indicates
# whether or not an rt value is larger than the average.
blomkvist_new <- mutate(blomkvist_filtered,
                        mean_rt = mean(---),
                        is_slow = rt > ---)

# Check out the new two columns
blomkvist_new

# Summarise the data
# get the mean of rt
# add the median of age
# get the mean of is_slow (what does this represent?)
# get the sum of is_slow (what does this represent?)
# what is N?
summarise(---,
          mean_rt = mean(---),
          median_age = ---,
          prop_is_slow = mean(---),
          sum_is_slow = sum(---),
          N = n())

# Group data by `meds_cat`
blomkvist_grouped <- group_by(blomkvist_new, ---)

# Check the the second line says "Groups: ..."
blomkvist_grouped

# Summarise the data with the same stats as above but with data grouped by `meds_cat`.
summarise(---,
          ---,
          ...)

# Don't forget to ungroup your data again :)
blomkvist_ungrouped <- ungroup(blomkvist_grouped)
# This doesn't make a difference here but is a good habit to develop.
