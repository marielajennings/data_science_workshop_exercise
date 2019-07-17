# Counterbalancing for sample data set
# This takes a set of raw data of people that were tested
# and removes all other data except their age groups to calculate
# how many people of each age group need to be tested (or excluded) for counterbalancing

# First delete 'Remaining_Master.csv' from your directory
# The end result of this script is to create 'Remaining_Master.csv', which:
# 1. removes participants that don't meet criterea
# 2. breaks remaining people into age groups
# 3. calculates the remaining amount of people to be tested
# 4. writes information into a new folder

# Set working directory
# this sets the location that R reads and writes files from
# HOW TO: open terminal > change to your local datascienceworkflow directory > type 'pwd' > copy and paste output setwd("<here>")
# the following is an example for the user "camillephanuef"
setwd("/Users/camillephaneuf/Desktop/repos/bc_data_science_presentation")

# Install and load necessary packages
# HOW TO: uncomment the line below if you do not have dplyr installed
# (you will get an error if you try running this code without it); dplyr is useful for working with data frames
# install.packages("dplyr")
library(dplyr)

# Imports in raw data from the local directory
# Open up original data file in your file manager to see what it looks like
data <- read.csv("data.csv")
    
# Cleans up data
# Only leaves individuals which are not marked by (== 1; == NA) under Rejected
# The "$" calls on a data field in the dataframe
data <- data[data$Rejected == 0,]
# Only leave individuals within age range of 36 to 84
data <- data[data$Age < 84 & data$Age >= 36,]

# Reformats data by age categories by 12
# creates new group of age.category
data$Age_Category <- (data$Age)/12
data$Age_Category <- floor(data$Age_Category)
data$Age_Category <- as.factor(as.character(data$Age_Category))

# ---CREATE REMAINING_MASTER---

# Calculate frequency values
Age_Condition_Table_Master <- table(data$List, data$Age_Category) 
# Inspect table
Age_Condition_Table_Master
Remaining_Master <- as.data.frame(Age_Condition_Table_Master)

# Rename columns of Remaining
colnames(Remaining_Master) <- c("Condition_Num","Age_Categories","Frequency")

# Add column that gives shows remaining to test
Remaining_Master$Remaining_to_Test <- 10 - Remaining_Master$Frequency

# Write to new CSV file (in other words, create a permanent file for the Remaining data frame)
write.csv(Remaining_Master, file = "Remaining_Master.csv", row.names = FALSE)
