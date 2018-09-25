# Name:
# I collaborated with:

# The following code loads (i.e. opens) all necessary packages.
library(ggplot2)
library(dplyr)
library(moderndive)

# Let's now read the help file associated with the dataset evals to get a
# sense of where the data comes from and what the variables means
?evals

# Let's explore this data using RStudio's built in spreadsheet viewer:
View(evals)



# Question 1 --------------------------------------------------------------
# a) Visualize the distribution of the numerical variable score, which is the
# teaching score. Have the bin widths be 0.25 teaching score units. Optional:
# See if using Google you can figure out to add informatative labels for the
# x-axis, y-axis, and title.
#
# Copy/paste/tweak the code below:


# b) Using only your eyes, what would you say the average teaching score
# approximately is? Do not compute the this value exactly, just visually
# approximate it.
#
# Write your answer as a "code comment":

#


# c) Now show the same histogram as above, but for men and women separately.
# Optional: See if using Google you can figure out to add informatative labels
# for the x-axis, y-axis, and title.
#
# Copy/paste/tweak the code below:


# d) Now compare teaching scores between men and women using a boxplot.
#
# Copy/paste/tweak the code below:


# e) Using only your eyes, who would you say tended to get higher evalutions
# scores from students, the male or female instructors?
#
# Write your answer as a "code comment":

#





# Question 2 --------------------------------------------------------------
# a) Create a visualization that displays the relationship between the teaching
# evaluation score and age.
#
# Copy/paste/tweak the code below:


# b) Using only your eyeballs (in other words without computing values exactly),
# is the relationship between these two variables positive? Meaning as
# professors' ages increase, so also do their teaching scores increase? Or is
# the relationship negative? Meaning as professors' ages increase, so also do
# their teaching scores decrease?
#
# Write your answer as a "code comment":

#


# c) Now recreate the plot from part a) so that we can also consider the
# relationship between the teaching evaluation score and age for men and women
# separately. Note there is more than one way to do this!
#
# Copy/paste/tweak the code below:

