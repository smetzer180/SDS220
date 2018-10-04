# Name:
# I collaborated with:

# The following code loads (i.e. opens) all necessary packages.
library(ggplot2)
library(dplyr)
library(moderndive)
library(readr)


# Question 1 --------------------------------------------------------------
# Recall the exercise from Lec2 where:
# -All the individuals with an even birthday (Ex: Nov 4th) took http://bit.ly/africa_quiz
# -All the individuals with an odd birthday (Ex: Feb 5th) took http://bit.ly/africa_experiment
# where the only difference in the survey was the "priming number" in the
# second to last question.

# Run the following code to load the "comma separated values" file of the
# results. This uses the read_csv() function from the readr package.
africa_results <- read_csv("https://rudeboybert.github.io/SDS220/static/PS/africa_results.csv")
View(africa_results)


# a) Using data wrangling commands from Chapter 5 in ModernDive, start with
# africa_results and after a series of %>% "then" pipes, end up with a data
# frame showing the median number of countries guessed for the two groups. The
# resulting data frame should have 2 rows and 2 columns.
#
# Copy/paste/tweak the code below:



# b) Create an exploratory visualization comparing the distribution of number
# of countries guessed for the two groups.
#
# Copy/paste/tweak the code below:



# c) IN YOUR OPINION, based on the results from parts a) and b), is there a
# "significant effect of the priming number on the guessed number of countries"
# in Africa.
#
# Write your answer as a "code comment":

#


# d) IN YOUR OPINION, why do you think one of the lead up questions was "Have
# you been to Africa before?"
#
# Write your answer as a "code comment":

#


# e) Recreate the exploratory visualization from part b), but now facetted by
# whether or not the individual has been to Africa.
#
# Copy/paste/tweak the code below:



# f) Based on the facetted plot, can you tell whether having been to Africa had
# an influence on the guesses? Explain/justify your answer
#
# Write your answer as a "code comment":

#





# Question 2 --------------------------------------------------------------
# Load the titanic dataset from the internet and take a look at it's contents.
# It contains demographic information about the 2201 passenengers on the Titanic
# disaster and information on whether they survived. Note there are 2201 rows in
# this data, one for each passenger:
titanic <- read_csv("https://rudeboybert.github.io/SDS220/static/PS/titanic.csv")
View(titanic)


# a) Overall survival. Using dplyr commands, output a table that displays the
# overall survival & death counts of the disaster. Your code should print out a
# table with two columns and two rows of data, along with a "header" row of the
# variable names.



# b) Survival split by sex. Using dplyr commands, output a table that displays
# the overall survival & death counts of the disaster split by recorded sex.
# Your code should print out a table with three columns and four rows of data,
# along with a "header" row of the variable names.



# c) Passenger ID. Using dplyr commands, output a table that displays only the
# passenger number of all 3rd class female children aboard the ship who died.
# Your code should print out a table with one column and number of rows
# corresponding to the number of 3rd class female children aboard the ship who
# died, along with a "header" row of the variable names.







