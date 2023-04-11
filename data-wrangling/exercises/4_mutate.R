# Load libraries
library(tidyverse)

# Import data as tibble
blomkvist <- read_csv("data/blomkvist.csv")

# Select id, smoker, age, medicine and rt of dominant hand renamed as rt
blomkvist <- select(blomkvist, ---)

# Remove all former smokers and rts larger than 1.5 secs.
blomkvist_filtered <- filter(blomkvist, ---)

# Make sure you code has worked!

# Then, lets continue with `mutate`!
# mutate allows you to create and change variables in your data.
# Like so:
# mutate(data, new_variable = some_function(old_variable))

# transform the rt to its logarithm
mutate(blomkvist_filtered, log_rt = log(---))

# add the mean rt to the data and centre rt by subtracting the mean from every value.
mutate(blomkvist_filtered, --- = mean(---, na.rm = TRUE),
                           rt_ctr = --- - ---)

# add a column that indicates whether or not an rt is larger than the mean
mutate(blomkvist_filtered, ---)

# instead of the mean lets use the upper 2.5% or the data. You can get this value
# using the quantile function.
quantile(blomkvist_filtered$rt, probs = .975)
# Use this function (not the value returned above) to create a variable that
# indicates whether or not an rt value is in the upper 2.5% of the data.
mutate(blomkvist_filtered, --- = ---)
