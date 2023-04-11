################################
#### Mixed Effect Model Demo ###
################################

### This demo and data has been adapted from a tutorial by
### Rens van De Schoot & Laurent Smeets

# Please read the follow chapter for more info:
# https://www.rensvandeschoot.com/wp-content/uploads/2017/09/02Ch2-Basic.pdf

#In this demo we have children nested in classrooms, and we are interested in 
#whether self-reported extraversion predicts popularity ratings. 

## packages
library(lme4) #for analysis
library(tidyverse) # for data manipulation and plotting
library(lmerTest) # to obtain p-value estimations

##read in data
popular2 <- read_csv("data/popular2.csv")

## plot data 
# Here we will visualise our data for first 20 classes 
xlab <- "Extraversion Scores"
ylab <- "Popularity Ratings"

p<- ggplot(data = filter(popular2, class < 21)) + 
  aes(x = extrav, y = popular) + 
  stat_smooth(method = "lm", se = FALSE) +
  # Put the points on top of lines
  geom_point() +
  facet_wrap("class") +
  labs(x = xlab, y = ylab) + 
  scale_x_continuous(breaks = 0:5*2)

p

### Model 1 Intercept only model (no predictors)

model1 <- lmer(popular ~ 1 + (1|class), data = popular2)

#lmer = function for mixed effect model
#popular = outcome variable
#1 = indicates intercept
#inside brackets is our random intercept/slopes
#1 inside bracket = random intercept
#variables to right of | indicate grouping variables

## get parameter estimates
summary(model1)

### Model 2 - Add fixed effect predictors

model2 <- lmer(popular ~ 1 + extrav + (1|class), data = popular2)
summary(model2)

# We can see an effect of extraversion on popularity ratings. 

## Model comparisons
# We can compare the fit of our two models using anova()

anova(model1, model2)

# model 2 is a better to fit the data, as indicated by
# AIC, BIC, and Chisq difference test. 

### Model 3 - random slopes
# for random extraversion slopes (1|class) becomes (1 + extrav |class)
model3 <- lmer(popular ~ 1 + extrav + (1 + extrav |class), data = popular2)
summary(model3)


## Lets compare a random intercept vs random slope model
anova(model2, model3)


