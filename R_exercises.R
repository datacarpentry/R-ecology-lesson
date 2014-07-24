# Exercises

# Exercise 1
# R as a calculator

# Play around in R a bit with math and characters

# Add, multiply and divide

# What happens if you add a character and a number?
# characters or strings (non-numeric values) are represented as 'a' or 'hello'

# Isn't R a great calculator!


# Exercise 2
# Variables in R

# You can also assign number or string to variables, like in algebra
# Once you import your data in to R, it will all be referenced by a variable, so 
# all your data will be accessed this way
# You can figure out what type of data it is by typing str(variable)

# Assign two numbers to different variables a and b, and add them

# Assign that sum to a new variable, c

# Print the results of that variable

# What type of data is this?

# Reassign the value of a or b to another value and get the sum again


# Assign a string to a variable, n

# Print out the string

# What type of data is this?

# Get help from R on str  - help(str)


# Exercise 3
# Vectors

# Create a vector, v, with the values 1 - 5


# Multiply that vector by 2. What happens?


# Create a vector, w, with the values 6 - 10


# Add vectors v and w. What happens?

# Create a vector, x, with values 6 - 9 

# Add vectors v and x. What happens?

# Create a vector, y,  of characters a - e

# Add v and y. What happens?

# What are the types of all your different vectors you just created?


# Exercise 4
# Importing data

# Import the file surveys.csv and assign it to the variable 'dat'

# Look at the data

# Using str(), class() and summary() get some information about the data

# How many rows does this data have? nrow()

# How many columns? ncol()

# How many values are in this vector. Use length()

# Look at the first 10 rows

# Exercise 5
# Getting the data ready for analysis

# The 'plot' value says its an integer rather than a factor. Change it to a factor with
dat$plot <- as.factor(dat$plot)

# Look at the structure of the data. Is it right now?

# Exercise 6
# Indexing

# Get the 4th row and 5th column from the data. What is the value?

# Get the 3rd to 5th row of data

# If data holds our array of survey data, what does data[3:3, 4:4] produce? 
# What about data[3:3, 4:1]? Explain the results to the person sitting next to you


# We can reference data by its index or by its name

# Do dat[,8] and dat$wgt give the same answer? Why?

# Get all the information for another column. If you don't remember column names, you 
# can look at the file in RStudio or do colnames(dat) or str(dat)

# Get the unique names of all the plots using unique()

# Get how many animals were captured in one plot using table()


# Exercise 7
# Calculating statistics

# Get rid of the NAs using 'complete.cases'
# Don't worry about the function itself, we'll just use it here, but it's awesome
dat2 <- dat[complete.cases(dat$wgt),]

# Now we can do statistics on the data. There are other ways of dealing with missing data 
# in R, but we're not going to cover it here.

# Calculate the mean weight of all the animals we captured

# Also calculate the median, standard deviation, minimum and maximum weight. For bonus 
# points calculate the standard error


# Exercise 8
# Statistics on subsets of data

# Get all the "DM" species

# How many of them are there?

# Calculate the mean and standar deviation of just the DM species


# Exercise 9
# Operations across axes

# The format is
# tapply(data_you_want_to_calculate, factor_to_sort_on, function)
# tapply(dat2$wgt, dat2$species, mean)
# Now we can put all the means into a variable

# species_means <- tapply(dat2$wgt, dat2$species, mean)

# Find the maximum and minimum values for weight for each species
# Save these values to a varible.
# What is the length of your new variable?

# Put all the data in to one table. In R it's called a data.frame
# d.summary = data.frame(species_means, species_min, species_max)

# Using aggregate, create a data frame with the standard deviation of weight for each species

# Exercise 10
# Plotting

# Create a plot showing the standard deviation of the species data













