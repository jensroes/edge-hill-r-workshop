# Load libraries
library(tidyverse)

# Import data as tibble
blomkvist <- read_csv("data/blomkvist.csv")

# Check out variable names
names(blomkvist)

# Select variables of interest
select(blomkvist, id, sex, smoker)

# Get rid of variables you don't need
select(blomkvist, -medicine)

# Select multiple variables
select(blomkvist, ends_with("_d"))

# or
select(blomkvist, age, starts_with("rt_"))

# Remove multiple variable
select(blomkvist, -contains("hand_"))

# Use where() to remove all variables that are of the type character (is.character).
select(blomkvist, where(---))

# After you selected your desired variables you can create a new data frame object
# using the assignment operator <-.
# Select id, age, sex
blomkvist_new <- select(blomkvist, ---, ---, ---)

# and confirm that the new object `blomkvist_new` only contains id, age, sex
glimpse(---)

# Tasks:
# Without spelling out every variable, ...
# select the following variables: id, medicine, rt_hand_nd, rt_foot_nd
select(blomkvist, ---)

# select the first 4 variables
select(---)

# remove all rt_ variables
select(---)

# remove all foot rt data
select(---)

# Use can rename variables while selecting them like so:
# select(data, new_name = old_name, var2, var3)
# Use select to keep `id` and all `rt_` variables and rename `id` to `ppt`.
select(---)

# Assign the data frame with `id` and all `rt_` variables to a new data frame `blomkvist_new`
--- <- select(---)

# Check out new data variable using glimpse
glimpse(---)

# You can save your new data in csv format using:
write_csv(---, "data/name_of_target_file.csv")
