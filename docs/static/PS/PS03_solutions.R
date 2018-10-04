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
ggplot(data = evals, mapping = aes(x = score)) +
  geom_histogram(binwidth = 0.25) +
  labs(x = "Teaching score", y = "Count", title = "Teaching scores at UT Austin")

# b) Using only your eyes, what would you say the average teaching score
# approximately is? Do not compute the this value exactly, just visually
# approximate it.
#
# Write your answer as a "code comment":

# In Albert's opinion: Maybe about 4.2? It's hard to say exactly because the
# data are not symmetric.

# c) Now show the same histogram as above, but for men and women separately.
# Optional: See if using Google you can figure out to add informatative labels
# for the x-axis, y-axis, and title.
#
# Copy/paste/tweak the code below:
ggplot(data = evals, mapping = aes(x = score)) +
  geom_histogram(binwidth = 0.25) +
  labs(x = "Teaching score", y = "Count", title = "Teaching scores at UT Austin by gender") +
  facet_wrap(~gender)

# d) Now compare teaching scores between men and women using a boxplot.
#
# Copy/paste/tweak the code below:
ggplot(data = evals, mapping = aes(x = gender, y = score)) +
  labs(x = "Gender", y = "Teaching score", title = "Teaching scores at UT Austin by gender") +
  geom_boxplot()

# e) Using only your eyes, who would you say tended to get higher evalutions
# scores from students, the male or female instructors?
#
# Write your answer as a "code comment":

# In Albert's opinion, the boxplot makes comparing the two groups easier, as you
# can do so with single vertical lines. While the female teachers got a median
# score of about 4.1, the male instructors got a median score of about 4.4.
# It seems male instructors unfortunately tend to get rated higher by students.





# Question 2 --------------------------------------------------------------
# a) Create a visualization that displays the relationship between the teaching
# evaluation score and age.
#
# Copy/paste/tweak the code below:
ggplot(data = evals, mapping = aes(x = age, y = score)) +
  labs(x = "age", y = "Teaching score", title = "Teaching scores at UT Austin by age") +
  geom_point()

# b) Using only your eyeballs (in other words without computing values exactly),
# is the relationship between these two variables positive? Meaning as
# professors' ages increase, so also do their teaching scores increase? Or is
# the relationship negative? Meaning as professors' ages increase, so also do
# their teaching scores decrease?
#
# Write your answer as a "code comment":

# Hard to say exactly, but in Albert's opinion the relationship looks negative!


# c) Now recreate the plot from part a) so that we can also consider the
# relationship between the teaching evaluation score and age for men and women
# separately. Note there is more than one way to do this!
#
# Copy/paste/tweak the code below:

# Option 1: Using facets
ggplot(data = evals, mapping = aes(x = age, y = score)) +
  labs(x = "age", y = "Teaching score", title = "Teaching scores at UT Austin by age") +
  geom_point() +
  facet_wrap(~gender)

# Option 2: Using color
ggplot(data = evals, mapping = aes(x = age, y = score, col = gender)) +
  labs(x = "age", y = "Teaching score", title = "Teaching scores at UT Austin by age") +
  geom_point()
