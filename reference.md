Cheat sheet of functions used in the lessons


## Lesson 1 -- Introduction to R

  * `length()`  # how many elements are in a particular vector
  * `class() `  # the class (the type of element) of an object
  * `str() `    # an overview of the object and the elements it contains
  * `c() `      # create vector; add elements to vector
  * ` [  ] `    # extract and subset vector
  * `%in% `     # to test if a value is found in a vector
  * `is.na()`   # test if there are missing values
  * `na.omit()` # Returns the object with incomplete cases removed
  * `complete.cases()`# elements which are complete cases

## Lesson 2 -- Starting with data

  * `download.file() `          # download files from the internet to your computer
  * `read.csv() `               # load CSV file into R memory
  * `head() `                   # check the top (the first 6 lines) of an object including data frames
  * `factor() `                 # create factors
  * `levels() `                 # check levels of a factor
  * `nlevels() `                # check number of levels of a factor
  * `as.numeric(levels(x))[x] ` # convert factors where the levels appear as numbers  to a numeric vector

## Lesson 3 -- Introducing data.frame

  * `data.frame()`  # create a data frame
  * `dim() `        # check dimension of data frame
  * `nrow() `       # returns the number of rows
  * `ncol() `       # returns the number of  columns
  * `head() `       # shows the first 6 rows
  * `tail() `       # shows the last 6 rows
  * `names() `      # returns the column names (synonym of colnames() for data frame objects)
  * `rownames() `   # returns the row names
  * `str() `        # check structure of the object and information about the class, length and content of each column
  * `summary() `    # summary statistics for each column
  * `seq() `        # generates a sequence of numbers

## Lesson 4 -- Aggregating and analyzing data with dplyr

  * `install.packages()` # install a CRAN package in R
  * `library() `         # load installed package into the current session
  * `select() `          # select columns of a data frame
  * `filter() `          # allows you to select a subset of rows in a data frame
  * `%>% `               # pipes to select and filter at the same time
  * `mutate() `          # create new columns based on the values in existing columns
  * `group_by() `        # split the data into groups, apply some analysis to each group, and then combine the results.
  * `summarize() `       # collapses each group into a single-row summary of that group
  * `tally()`            # counts the total number of records for each category.
  * `write.csv() `       # save CSV file

## Lesson 5 -- Data visualization with ggplot2

  * `ggplot2(data= , aes(x= , y= )) + geom_point( ) + facet_wrap () +
    theme_bw() + theme() `
  * `aes()` # by selecting the variables to be plotted and the variables to
    define the presentation such as plotting size, shape color, etc.
  * `geom_` # graphical representation of the data in the plot (points, lines, bars). To add a geom to the plot use + operator
  * `facet_wrap()` # allows to split one plot into multiple plots based on a factor included in the dataset
  * `theme_bw()`   # set the background to white
  * `theme()`      # used to locally modify one or more theme elements in a specific ggplot object
  *
## Lesson 6 -- R and SQL

  * `src_sqlite`  # connect dplyr to a SQLite database file
  * `tbl`         # connect to a table within a database
  * `collect`     # retrieve all the results from the database
  * `explain`     # show the SQL translation of a dplyr query
  * `inner_join`  # perform an inner join between two tables
  * `copy_to`     # copy a data frame as a table into a database
