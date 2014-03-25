## Analyzing Patient Data


We are studying inflammation in patients who have been given a new treatment for arthritis,
and need to analyze the first dozen data sets. 
The data sets are stored in .csv each row holds information for a single patient, 
and the columns represent successive days. 
The first few rows of our first file look like this:

	0,0,1,3,1,2,4,7,8,3,3,3,10,5,7,4,7,7,12,18,6,13,11,11,7,7,4,6,8,8,4,4,5,7,3,4,2,3,0,0
	0,1,2,1,2,1,3,2,2,6,10,11,5,9,4,4,7,16,8,6,18,4,12,5,12,7,11,5,11,3,3,5,4,4,5,5,1,1,0,1
	0,1,1,3,3,2,6,2,5,9,5,7,4,5,4,15,5,11,9,10,19,14,12,17,7,12,11,7,4,2,10,5,4,2,2,3,2,2,1,1
	0,0,2,0,4,2,2,1,6,7,10,7,9,13,8,8,15,10,10,7,17,4,4,7,6,15,6,4,9,11,3,5,6,3,3,4,2,3,2,1
	0,1,1,3,3,1,3,5,2,4,4,7,6,5,3,10,8,10,6,17,9,14,9,7,13,9,12,6,7,7,9,6,3,2,2,4,2,0,1,1`

###We want to:

* load that data into memory,
* calculate the average inflammation per day across all patients, and
* plot the result.
To do all that, we'll have to learn a little bit about programming.

Objectives
-------------
* Explain what a library is, and what libraries are used for.
* Load an R library and use the things it contains.
* Read tabular data from a file into a program.
* Assign values to variables.
* Learn about data types
* Select individual values and subsections from data.
* Perform operations on arrays of data.
* Display simple graphs.

Loading Data
----------------

Words are useful, but what's more useful are the sentences and stories we use them to build. 
Similarly, while a lot of powerful tools are built into languages like R, 
even more lives in the libraries they are used to build.
Importing a library is like getting a piece of lab equipment out of a storage locker
and setting it up on the bench. 
Once it's done, we can ask the library to do things for us.

To load our inflammation data, we need to locate our data.
We will use `setwd()` and `read.csv()`. These are built-in packages in R.
Let's check out the help screen.

* download the inflammation file
* put it in your working directory for these exercises


		setwd("pathname")
	
		read.csv("inflammation-01.csv")

The expression read.csv() is a function call that asks R to run the function read.csv that belongs to base R. 

`read.csv` has many parameters including the name of the file we want to read, 
and the delimiter that separates values on a line. 
These both need to be character strings (or strings for short), so we put them in quotes. 
header tells the program if the first line contains column names or data.

When we are finished typing and press Control+Enter, the console runs our command. 
Since we haven't told it to do anything else with the function's output, the console displays it. 
In this case, that output is the data we just loaded. 

Our call to `read.csv` read our file, but didn't save the data in memory. 
To do that, we need to assign the dataframe to a variable. 
A variable is just a name for a value, such as x, current_temperature, or subject_id. 
We can create a new variable simply by assigning a value to it using `=` or `<-`

	weight_kg = 55

Once a variable has a value, we can print it:

	print (weight_kg)

and do arithmetic with it:
 
	2.2 * weight_kg

We can use the function `paste` to print several things at once, if we separate them with commas.
	
	print (paste('weight in pounds:', 2.2 * weight_kg))

We can also change a variable's value by assigning it a new one:

	weight_kg = 57.5
	print (paste('weight in kilograms is now:', weight_kg))

If we imagine the variable as a sticky note with a name written on it, 
assignment is like putting the sticky note on a particular value:

This means that assigning a value to one variable does not change the values of other variables. 
For example, let's store the subject's weight in pounds in a variable:

	weight_lb = 2.2 * weight_kg
	print (paste('weight in kilograms:', weight_kg, 'and in pounds:', weight_lb))

and then change weight_kg:
	
	weight_kg = 100.0
	print (paste('weight in kilograms is now:', weight_kg, 'and weight in pounds is still:', weight_lb))


__Updating a Variable__

Since weight_lb doesn't "remember" where its value came from, it isn't automatically updated when weight_kg changes. 
This is different from the way spreadsheets work.

__Challenges__
Draw diagrams showing what variables refer to what values after each statement in the following program:

	mass = 47.5
	age = 122
	mass = mass * 2.0
	age = age - 20

We can also add to variable that are vectors, and update them by making them longer. 
For example, if we are creating a vector of patient weights, we could update that vector 
using append. Append takes two arguments, and adds the second item to the end of the first one.

	weights = c(100)
	weights = append(weights, 80)

What happens here is that we take the original vector weights, 
and we are adding the second item to the end of the first one.
We can do this over and over again to build a vector or a dataset. 
As we program, this may be useful to autoupdate results that we are collecting or calculating.


Now that we know how to assign things to variables, let's re-run read.csv and save its result:

	data = read.csv('inflammation-01.csv', header = FALSE)

This statement doesn't produce any output because assignment doesn't display anything. 
If we want to check that our data has been loaded, we can print the variable's value:

`print data` or `data` (we can simply type it in)

__BREAK__
* Make sure everyone has imported the data
* tell me how many rows and columns there are
* what kind of data is it?


Manipulating Data
---------------------

Now that our data is in memory, we can start doing things with it. 
First, let's ask what type of thing data refers to:

	class(data)
	str(data)

The output tells us that data currently is a data.frame in R. 
This is similar to a spreadsheet in excel, that many of us are familiar with using.

###data frames
are the de facto data structure for most tabular data and what we use for statistics.

Data frames can have additional attributes such as rownames(), which can be useful for annotating data, like subject_id or sample_id. But most of the time they are not used.

Some additional information on data frames:

* Usually created by `read.csv()` and `read.table()`.
* Can convert to matrix with `data.matrix()`
* Coercion will be forced and not always what you expect.
* Can also create with data.frame() function.
* Find the number of rows and columns with nrow(df) and ncol(df), respectively.
* Rownames are usually 1..n.

__Useful functions__

* `head()` - see first 6 rows
* `tail()` - see last 6 rows
* `dim()` - see dimensions
* `nrow()` - number of rows
* `ncol()` - number of columns
* `str()` - structure of each column
* `names()` - will list the names attribute for a data frame (or any object really), which gives the column names.
* A data frame is a special type of list where every element of the list has same length.

`str` output tells us the dimensions and the data types (int is integer) of each column.

We can see what its shape is like this:

	dim(data)
	nrow(data)
	ncol(data)

This tells us that data has 60 rows and 40 columns. 

###Indexing

If we want to get a single value from the dataframe, 
we must provide an index in square brackets, just as we do in math:

	print (paste('first value in data:', data[1,1]))
	print (paste('middle value in data:', data[30,20]))
 
R indexes starting at 1. Programming languages like Fortran, MATLAB, and R start counting at 1, 
because that's what human beings have done for thousands of years. 
Languages in the C family (including C++, Java, Perl, and Python) count from 0 because that's simpler for computers to do. 

An index like [30, 20] selects a single element of an array, 
but we can select whole sections as well. 
For example, we can select the first ten days (columns) of values 
for the first four (rows) patients like this:

	data[1:4, 1:10]

The slice 1:4 means, "Start at index 1 and go to index 4." 
We don't have to start slices at 0:

	data[5:10, 0:10]

and we don't have to take all the values in the slice, we can use c() to 
select certain values or groups of values:

	data[c(1:10, 20:30), c(1:10, 20:30)]

Here we have taken rows and columns 1 through10 and 20 through 30.

	data[seq(1, 12, 3), seq(1,20, 3)]

Here we have used the built-in function seq to take regularly spaced rows and columns.
For example, we have taken rows 1, 4, 7, and 10, and columns 1, 4, 7, 10, 13, 16, and 19. 
(Again, we always include the lower bound, but stop when we reach or cross the upper bound.)

If we want to know the average inflammation of all patients on all days, 
we cannot directly take the mean of a dataframe. But we can take it from a matrix.

###Matrix

Matrices are a special vector in R. They are not a separate type of object but simply an atomic vector with dimensions added on to it. Matrices have rows and columns.

	m <- matrix(nrow = 2, ncol = 2)
	m

	dim(m)

Matrices are filled column-wise.

	m <- matrix(1:6, nrow = 2, ncol = 3)

Other ways to construct a matrix

	m <- 1:10
	dim(m) <- c(2, 5)

This takes a vector and transform into a matrix with 2 rows and 5 columns.

Another way is to bind columns or rows using cbind() and rbind().

	x <- 1:3
	y <- 10:12
	cbind(x, y)

	rbind(x, y)

You can also use the byrow argument to specify how the matrix is filled. From R's own documentation:

	mdat <- matrix(c(1,2,3, 11,12,13), nrow = 2, ncol = 3, byrow = TRUE,
               dimnames = list(c("row1", "row2"),
                               c("C.1", "C.2", "C.3")))
	mdat
	
Lets convert our dataframe to a matrix, but give it a new name:

	datamatrix = as.matrix(data)
	
And then take the mean of all the values:

	mean(datamatrix)

There are lots of useful built-in commands that we can use in R:

	print (paste('maximum inflammation:', max(datamatrix)))
	print (paste('minimum inflammation:', min(datamatrix)))
	print (paste('standard deviation:', sd(datamatrix)))


When analyzing data, though, we often want to look at partial statistics, 
such as the maximum value per patient or the average value per day. 
One way to do this is to select the data we want to create a new temporary array, 
then ask it to do the calculation:

	patient_1 = data[1, ] # first row, all of the columns
	print (paste('maximum inflammation for patient 1:', max(patient_1)))

We don't actually need to store the row in a variable of its own. 
Instead, we can combine the selection and the method call:

	print (paste('maximum inflammation for patient 2:', max(data[2,])))

__EXERCISES__

1. If data holds our array of patient data, what does data[3:3, 4:4] produce? 
What about data[3:3, 4:1]? Explain the results to the person sitting next to you


FUNCTIONS - Operations Across Axes
----------------------

What if we need the maximum inflammation for all patients, or the average for each day? 
As the diagram below shows, we want to perform the operation across an axis:

To support this, in R we can use the `apply` function:

	help(apply)

Apply allows us to repeat a function on all of the rows (1), columns (2), or both(1:2) of an array or matrix.

If each row is a patient, and we want to know each patient's average inflammation, 
we will need to iterate our method across all of the rows. 
		
		avg_inflammation = apply(data, 2, mean)
	
Challenge
---------
1. Find the maximum and minimum values for inflammation at each day (rows are patients, and columns are days).
2. Save these values to a varible.
3. What is the length of your new variable?
	
Now that we have all this summary information, we can put it back together 
into a dataframe that we can use for further analysis and plotting, provided they are 
the same length.

	summary = data.frame(time, avg_inflammation, min_inflammation, max_inflammation)`


Plotting
---------------

The mathematician Richard Hamming once said, 
"The purpose of computing is insight, not numbers," 
and the best way to develop insight is often to visualize data. 
Visualization deserves an entire lecture (or course) of its own, 
but we can explore a few features of R's base plotting package and ggplot2 here. 

Lets use the average inflammation data that we saved and plot it over the study time.
We can create a vector of our study days (the number of columns in data)
`time = c(1:40)` or `time = c(1:ncol(data))`

	plot(time, avg_inflammation)

The result is roughly a linear rise and fall, which is suspicious: 
based on other studies, we expect a sharper rise and slower fall. 
Let's have a look at two other statistics:

	plot(time, max_inflammation)
	plot(time, min_inflammation)

The maximum value rises and falls perfectly smoothly, 
while the minimum seems to be a step function. 
Neither result seems particularly likely, so either there's a mistake in our calculations 
or something is wrong with our data.

	ggplot(summary, aes(time, avg_inflammation)) + geom_point()

__EXERCISES__

1. Create a plot showing the standard deviation of the inflammation data 
for each day across all patients.

2. Create a ggplot that shows the data as a line. As a histogram. etc.


Key Points
==============

* Import a library into a program using library libraryname.
* What are the data types in R?
* Use `variable = value` to assign a value to a variable in order to record it in memory.
* Variables are created on demand whenever a value is assigned to them.
* Use print something to display the value of something.
* The expression `dim()` gives the dimensions of a dataframe or matrix.
* Use `object[x, y]` to select a single element from an array.
* Array indices start at 1.
* Use low:high to specify a slice that includes the indices from low to high.
* Use # some kind of explanation to add comments to programs.
* Use `mean()`, `max()`, `min()` and `sd()` to calculate simple statistics.
* Update vectors using append
* Write a simple for loop 
* Use base R and the `ggplot2` library for creating simple visualizations.

Next Steps
-------------
Our work so far has convinced us that something's wrong with our first data file. 
We would like to check the other 11 the same way, 
but typing in the same commands repeatedly is tedious and error-prone. 
Since computers don't get bored (that we know of), 
we should create a way to do a complete analysis with a single command, 
and then figure out how to repeat that step once for each file. 
These operations are the subjects of the next two lessons.























