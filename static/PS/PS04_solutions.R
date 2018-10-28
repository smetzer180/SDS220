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
africa_results %>%
  group_by(priming_number) %>%
  summarize(median_guess = median(how_many_countries))


# b) Create an exploratory visualization comparing the distribution of number
# of countries guessed for the two groups.
#
# Copy/paste/tweak the code below:
ggplot(africa_results, aes(x = priming_number, y = how_many_countries)) +
  geom_boxplot() +
  labs(x = "Priming number", y = "Number of countries in Africa guessed",
       title = "Effects of priming number of number of countries guessed in Africa")

ggplot(africa_results, aes(x = how_many_countries)) +
  geom_histogram(binwidth = 10) +
  facet_wrap(~priming_number) +
  labs(x = "Priming number", y = "Number of countries in Africa guessed",
       title = "Effects of priming number of number of countries guessed in Africa")

# c) IN YOUR OPINION, based on the results from parts a) and b), is there a
# "significant effect of the priming number on the guessed number of countries"
# in Africa.
#
# Write your answer as a "code comment":

# In Albert's opinion, yes. The two boxes don't even overlap. Furthermore, we'll
# see later that the difference in average number of countries guessed is
# "statistically significant".


# d) IN YOUR OPINION, why do you think one of the lead up questions was "Have
# you been to Africa before?"
#
# Write your answer as a "code comment":

# Because people who have been to Africa might answer differently than those
# who haven't; their answers are likely to be closer to the right answer of
# 54 countries (as recognized by the African Union). So we want to take this
# variable into consideration.


# e) Recreate the exploratory visualization from part b), but now facetted by
# whether or not the individual has been to Africa.
#
# Copy/paste/tweak the code below:
ggplot(africa_results, aes(x = priming_number, y = how_many_countries)) +
  geom_boxplot() +
  facet_wrap(~been_to_africa) +
  labs(x = "Priming number", y = "Number of countries in Africa guessed",
       title = "Effects of priming number of number of countries guessed in Africa")


# f) Based on the facetted plot, can you tell whether having been to Africa had
# an influence on the guesses? Explain/justify your answer
#
# Write your answer as a "code comment":

# Because there were no individuals who have been to Africa who were assigned
# to the 94 group, we cannot compare the two differences. Furthermore, there are
# only two individuals who have been to Africa. In my opinion, if we did have a
# large sample of students who have been to Africa, the two boxplots in the
# right-hand facet would be closer together, around the true answer of 54.





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
titanic %>%
  group_by(Survived) %>%
  summarize(n = n())


# b) Survival split by sex. Using dplyr commands, output a table that displays
# the overall survival & death counts of the disaster split by recorded sex.
# Your code should print out a table with three columns and four rows of data,
# along with a "header" row of the variable names.
titanic %>%
  group_by(Survived, Sex) %>%
  summarize(n = n())


# c) Passenger ID. Using dplyr commands, output a table that displays only the
# passenger number of all 3rd class female children aboard the ship who died.
# Your code should print out a table with one column and number of rows
# corresponding to the number of 3rd class female children aboard the ship who
# died, along with a "header" row of the variable names.
titanic %>%
  filter(Class == "3rd", Age == "Child", Sex == "Female", Survived == "No") %>%
  select(passenger_number)
