# Name:
# I collaborated with:

# The following code loads (i.e. opens) all necessary packages.
library(ggplot2)
library(dplyr)
library(fivethirtyeight)

# "Run" the following to see the hate_crimes dataset.
hate_crimes

# Note: Depending on your screensize, you'll only be able to see the first few rows
# and first few columns of the data. But what if you want to preview ALL the
# data?


# Copy, paste, and tweak the code that allows you to visually explore the
# hate_crimes dataset in a spreadsheet below:

# Note: The most basic step to an "exploratory data analysis (EDA)" is simply looking
# at your data. Given that this data is a "flat file" (i.e. in spreadsheet
# table) format, using
View(hate_crimes)


# Copy, paste, and tweak the code that allows you to see the "help file" for the
# hate_crimes dataset, in particular a description of all the variables
# included. Do this below:
?hate_crimes

# Note: Any good R package has good "documentation" telling you what the data
# means and all sources! In particular, it will tell us which of the two
# hate crimes variables in hate_crimes we should be using.



# Copy, paste, and tweak the code that creates a scatterplot visualization with
# -x-axis: Proportion of the state that voted for Donald Trump
# -y-axis: The average number of hate crimes per 100k individuals between 2010-2015
# Do this below:
ggplot(data = hate_crimes, mapping = aes(x = share_vote_trump, y = avg_hatecrimes_per_100k_fbi)) +
  geom_point()

# Note: Why am I getting the message?
# Warning message:
#  Removed 1 rows containing missing values (geom_point).
# Look in the Viewer, click on the arrow next to avg_hatecrimes_per_100k_fbi to
# sort these values and scroll to the bottom. You'll see an NA for Hawaii,
# meaning the data is missing. So ggplot can't plot a value for them to the
# bottom

# I'm going to go one step further and add informative axes labels and a title:
ggplot(data = hate_crimes, mapping = aes(x = share_vote_trump, y = avg_hatecrimes_per_100k_fbi)) +
  geom_point() +
  labs(x = "Proportion of state voting Trump", y = "Average number of hate crimes per 100k",
       title = "Hate crime rates vs proportion voting Trump")

# We see a negative relationship between these two variables. Meaning as a
# higher proportion of a state voted for Trump, there are less incidents of hate
# crimes. Say what?

# Note that the overall trend is greatly influenced by the outlier in the top
# left: Washington DC.
