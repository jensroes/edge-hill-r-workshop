###################################
### t-test Error Check Exercise ###
###################################


######################################################################################################################

### Example 1 ###

#1# try running the follow code
m2.independent <- t.test(DSSTScore ~ SportGroup, paired = FALSE, data = df_Sports, var.equal = TRUE)

#2# Take a look at the error message. What kind of error is this?

#3# Change the following code to fix the error
m2.independent <- t.test(DSSTScore ~ SportGroup, paired = FALSE, data = df_Sports, var.equal = TRUE)

######################################################################################################################

### Example 2 ###

#1# try running the follow code
m3.independent <- t.test(MOTScore ~ SportGroup, paired = FALSE data = df_Sports, var.equal = TRUE)

#2# Take a look at the error message. What kind of error is this?

#3# Change the following code to fix the error
m3.independent <- t.test(MOTScore ~ SportGroup, paired = FALSE data = df_Sports, var.equal = TRUE)

#4# Did that fix it?


######################################################################################################################





