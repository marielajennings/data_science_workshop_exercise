# Counterbalancing for sample data set
# This takes a set of raw data 
# and removes all other data except age groups to calculate
# how many people of each age group need to be tested  for counterbalancing

# The end result of this script is 'Remaining_Master.csv', which:
# 1. removes participants that don't meet criteria
# 2. breaks remaining people into age groups
# 3. calculates the remaining amount of people to be tested



##################################################################################################
# TO-DO: Set working directory
# this sets the location that R reads and writes files from
# HOW TO: open terminal > change to your local datascienceworkflow directory > type 'pwd' > copy and paste output > setwd("<here>")






# Install and load necessary packages
# HOW TO: uncomment the line below if you do not have dplyr installed
# (you will get an error if you try running this code without it); dplyr is useful for working with dataframes
# install.packages("dplyr")
#TO-DO: Load the package dplyr




##TO-DO: read in the data in data.csv and assign it to a dataframe





    
# TO-DO: Clean up the data; only leave individuals which are not marked by (== 1; == NA) in the Rejected column of the dataframe







# TO-DO: Only leave individuals within age range of 36 to 84






# TO-DO: Create a column for Age_Categories which calculates those by increments of 12 (e.g. Divide Age by 12 to determine the category an individual falls into); HINT: use 'floor' to get a whole number; 






#TO-DO: Convert the values in Age_Category to factors







#TO-DO: Create a *table* from the List and Age_Category columns in the original dataframe; 
# this will give you the frequency values for each list (e.g. how many individuals of each age category have been tested for each list);
# You might want to inspect the table







#TO-DO: Convert your table from the previous step to a dataframe, and assign the dataframe to a new variable called 'Remaining_Master'







# TO-DO: Rename the columns of Remaining_Master with more informative names (e.g. List or Condition, Age Category, Frequency or Total Number Tested)






# TO-DO: Add a new column that calculates how many subjects still need to be tested for each List+Age Category combination; 
#assume the total number that needs to be tested is 10 for each List+Age Category







# T0-DO: Write your Remaning_Master dataframe to a new CSV file in the same directory







###If you have trouble with any of the above steps, refer to the example code in Counterbalancing.R
