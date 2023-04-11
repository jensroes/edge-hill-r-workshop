##########################
### Linear Models in R ###
##########################

# packages
library(tidyverse) # for data wrangling
library(lm.beta) # for standardized betas 

# Task 1 - Load and read in NHANES package


# Task 2 - explore the NHANES data


## Linear Regression
# Task 3.1 run Model 1 
# Model 1 - Does DaysMentHlthBad predict Poverty score (low scores indicate higher levels of poverty)?
m1 <- lm(Poverty ~ DaysMentHlthBad, data = NHANES)
summary(m1)

# Question - Why might it not be suitable to use DaysMentHlthBad as an outcome variable
# in this linear model?

# Task 3.2 run Model 2 
# Model 2 - add an additional predictor of your choice to Model 1 


## Request standardized betas using lm.beta()

## Request confidence intervals for unstandardized betas using confint()



################################
### t-test as a linear model ###
################################

# Task 4 
# Run an independent samples t-test exploring the difference in UrineFlow1 
# as a function of gender


# Linear model 
m3.lm <- lm(UrineFlow1 ~ Gender, data = NHANES)
summary(m3.lm)

###############################
### ANOVA as a linear model ###
###############################

# Task 5
# Run a one-way ANOVA exploring the difference in UrineFlow1 
# as a function of current Work status (Working, NotWorking, Looking)



#Linear model 
m4.lm <- lm(UrineFlow1 ~ Work, data = NHANES)
summary(m4.lm)

