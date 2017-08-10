


### Creating objects in R
### Challenge
##
## What are the values after each statement in the following?
##
## mass <- 47.5            # mass?
## age  <- 122             # age?
## mass <- mass * 2.0      # mass?
## age  <- age - 20        # age?
## mass_index <- mass/age  # mass_index?
### Vectors and data types
## ## We’ve seen that atomic vectors can be of type character, numeric, integer, and
## ## logical. But what happens if we try to mix these types in a single
## ## vector?
## 
## ## What will happen in each of these examples? (hint: use `class()` to
## ## check the data type of your object)
## num_char <- c(1, 2, 3, "a")
## 
## num_logical <- c(1, 2, 3, TRUE)
## 
## char_logical <- c("a", "b", "c", TRUE)
## 
## tricky <- c(1, 2, 3, "4")
## 
## ## Why do you think it happens?
## 
## ## You've probably noticed that objects of different types get
## ## converted into a single, shared type within a vector. In R, we call
## ## converting objects from one class into another class
## ## _coercion_. These conversions happen according to a hierarchy,
## ## whereby some types get preferentially coerced into other types. Can
## ## you draw a diagram that represents the hierarchy of how these data
## ## types are coerced?
### Challenge (optional)
##
## * Can you figure out why `"four" > "five"` returns `TRUE`?
## ### Challenge
## 1. Using this vector of length measurements, create a new vector with the NAs
## removed.
##
##    lengths <- c(10,24,NA,18,NA,20)
##
## 2. Use the function `median()` to calculate the median of the `lengths` vector.


### Presentation of the survey data
## download.file("https://ndownloader.figshare.com/files/2292169",
##               "data/portal_data_joined.csv")

## Challenge
## Based on the output of `str(surveys)`, can you answer the following questions?
## * What is the class of the object `surveys`?
## * How many rows and how many columns are in this object?
## * How many species have been recorded during these surveys?


## Indexing and subsetting data frames
### Challenges:
###
### 1. Create a `data.frame` (`surveys_200`) containing only the
###    observations from row 200 of the `surveys` dataset.
###
### 2. Notice how `nrow()` gave you the number of rows in a `data.frame`?
###
###      * Use that number to pull out just that last row in the data frame
###      * Compare that with what you see as the last row using `tail()` to make
###        sure it's meeting expectations.
###      * Pull out that last row using `nrow()` instead of the row number
###      * Create a new data frame object (`surveys_last`) from that last row
###
### 3. Use `nrow()` to extract the row that is in the middle of the
###    data frame. Store the content of this row in an object named
###    `surveys_middle`.
###
### 4. Combine `nrow()` with the `-` notation above to reproduce the behavior of
###    `head(surveys)` keeping just the first through 6th rows of the surveys
###    dataset.

### Factors
sex <- factor(c("male", "female", "female", "male"))
f <- factor(c(1990, 1983, 1977, 1998, 1990))
as.numeric(f)               # wrong! and there is no warning...
as.numeric(as.character(f)) # works...
as.numeric(levels(f))[f]    # The recommended way.
## bar plot of the number of females and males captured during the experiment:
plot(surveys$sex)
## Challenges
##
## * Rename "F" and "M" to "female" and "male" respectively.
## * Now that we have renamed the factor level to "missing", can you recreate the
##   barplot such that "missing" is last (after "male")
## ## Challenge:
## ##  There are a few mistakes in this hand-crafted `data.frame`,
## ##  can you spot and fix them? Don't hesitate to experiment!
## animal_data <- data.frame(animal=c(dog, cat, sea cucumber, sea urchin),
##                           feel=c("furry", "squishy", "spiny"),
##                           weight=c(45, 8 1.1, 0.8))
## ## Challenge:
## ##   Can you predict the class for each of the columns in the following
## ##   example?
## ##   Check your guesses using `str(country_climate)`:
## ##   * Are they what you expected? Why? why not?
## ##   * What would have been different if we had added `stringsAsFactors = FALSE`
## ##     to this call?
## ##   * What would you need to change to ensure that each column had the
## ##     accurate data type?
## country_climate <- data.frame(country=c("Canada", "Panama", "South Africa", "Australia"),
##                                climate=c("cold", "hot", "temperate", "hot/temperate"),
##                                temperature=c(10, 30, 18, "15"),
##                                northern_hemisphere=c(TRUE, TRUE, FALSE, "FALSE"),
##                                has_kangaroo=c(FALSE, FALSE, FALSE, 1))


### Manipulating and analyzing data with dplyr
## ## Pipes Challenge:
## ##  Using pipes, subset the data to include individuals collected
## ##  before 1995, and retain the columns `year`, `sex`, and `weight.`
## 
## ## Mutate Challenge:
## ##  Create a new data frame from the `surveys` data that meets the following
## ##  criteria: contains only the `species_id` column and a column that
## ##  contains values that are half the `hindfoot_length` values (e.g. a
## ##  new column `hindfoot_half`). In this `hindfoot_half` column, there are
## ##  no NA values and all values are < 30.
## 
## ##  Hint: think about how the commands should be ordered to produce this data frame!
## 
## ## Tally Challenges:
## ##  1. How many individuals were caught in each `plot_type` surveyed?
## 
## ##  2. Use `group_by()` and `summarize()` to find the mean, min, and
## ##  max hindfoot length for each species (using `species_id`).
## 
## ##  3. What was the heaviest animal measured in each year? Return the
## ##  columns `year`, `genus`, `species_id`, and `weight`.
## 
## ## 4. You saw above how to count the number of individuals of each `sex` using a
## ## combination of `group_by()` and `tally()`. How could you get the same result
## ## using `group_by()` and `summarize()`? Hint: see `?n`.
## 
## ## Reshaping challenges
## 
## ## 1. Make a wide data frame with `year` as columns, `plot_id`` as rows, and the values are the number of genera per plot. You will need to summarize before reshaping, and use the function `n_distinct` to get the number of unique types of a genera. It's a powerful function! See `?n_distinct` for more.
## 
## ## 2. Now take that data frame, and make it long again, so each row is a unique `plot_id` `year` combination
## 
## ## 3. The `surveys` data set is not truly wide or long because there are two columns of measurement - `hindfoot_length` and `weight`.  This makes it difficult to do things like look at the relationship between mean values of each measurement per year in different plot types. Let's walk through a common solution for this type of problem. First, use `gather` to create a truly long dataset where we have a key column called `measurement` and a `value` column that takes on the value of either `hindfoot_length` or `weight`. Hint: You'll need to specify which columns are being gathered.
## 
## ## 4. With this new truly long data set, calculate the average of each `measurement` in each `year` for each different `plot_type`. Then `spread` them into a wide data set with a column for `hindfoot_length` and `weight`. Hint: Remember, you only need to specify the key and value columns for `spread`.
## 
## ### Create the dataset for exporting:
## ##  Start by removing observations for which the `species_id`, `weight`,
## ##  `hindfoot_length`, or `sex` data are missing:
## surveys_complete <- surveys %>%
##   filter(species_id != "",        # remove missing species_id
##   !is.na(weight),                 # remove missing weight
## 		  !is.na(hindfoot_length),        # remove missing hindfoot_length
## 		  sex != "")                      # remove missing sex
## 
## ##  Now remove rare species in two steps. First, make a list of species which
## ##  appear at least 50 times in our dataset:
## species_counts <- surveys_complete %>%
##               group_by(species_id) %>%
##               tally %>%
## 				          filter(n >= 50) %>%
## 				          select(species_id)
## 
## ##  Second, keep only those species:
## surveys_complete <- surveys_complete %>%
##              filter(species_id %in% species_counts$species_id)
## 


### Data Visualization with ggplot2
## install.packages("hexbin")
## surveys_plot +
##  geom_hex()
## ### Challenge with hexbin
## ##
## ## To use the hexagonal binning with **`ggplot2`**, first install the `hexbin`
## ## package from CRAN:
## 
## install.packages("hexbin")
## 
## ## Then use the `geom_hex()` function:
## 
## surveys_plot +
##     geom_hex()
## 
## ## What are the relative strengths and weaknesses of a hexagonal bin
## ## plot compared to a scatter plot?
## ### Challenge with scatter plot:
## ##
## ##  Use what you just learned to create a scatter plot of `weight`
## ## over `species_id` with the plot types showing in different colors.
## ## Is this a good way to show this type of data?
## ## Challenge with boxplots:
## ##  Start with the boxplot we created:
## ggplot(data = surveys_complete, aes(x = species_id, y = weight)) +
##   geom_boxplot(alpha = 0) +
##   geom_jitter(alpha = 0.3, color = "tomato")
## 
## ##  1. Replace the box plot with a violin plot; see `geom_violin()`.
## 
## ##  2. Represent weight on the log10 scale; see `scale_y_log10()`.
## 
## ##  3. Create boxplot for `hindfoot_length` overlaid on a jitter layer.
## 
## ##  4. Add color to the datapoints on your boxplot according to the
## ##  plot from which the sample was taken (`plot_id`).
## ##  Hint: Check the class for `plot_id`. Consider changing the class
## ##  of `plot_id` from integer to factor. Why does this change how R
## ##  makes the graph?
## 
## ### Plotting time series challenge:
## ##
## ##  Use what you just learned to create a plot that depicts how the
## ##  average weight of each species changes through the years.
## 
## ### Final plotting challenge:
## ##  With all of this information in hand, please take another five
## ##  minutes to either improve one of the plots generated in this
## ##  exercise or create a beautiful graph of your own. Use the RStudio
## ##  ggplot2 cheat sheet for inspiration:
## ##  https://www.rstudio.com/wp-content/uploads/2015/08/ggplot2-cheatsheet.pdf


## SQL databases and R
## install.packages("dbplyr")
## library(dbplyr)
library(dplyr)
mammals <- src_sqlite("data/portal_mammals.sqlite")
mammals
tbl(mammals, sql("SELECT year, species_id, plot_id FROM surveys"))
surveys <- tbl(mammals, "surveys")
surveys %>%
    select(year, species_id, plot_id)

### Challenge
## Write a query that returns the number of rodents observed in each
## plot in each year.

##  Hint: Connect to the species table and write a query that joins
##  the species and survey tables together to exclude all
##  non-rodents. The query should return counts of rodents by year.

## Optional: Write a query in SQL that will produce the same
## result. You can join multiple tables together using the following
## syntax where foreign key refers to your unique id (e.g.,
## `species_id`):

## SELECT table.col, table.col
## FROM table1 JOIN table2
## ON table1.key = table2.key
## JOIN table3 ON table2.key = table3.key

## with dplyr syntax
species <- tbl(mammals, "species")

left_join(surveys, species) %>%
  filter(taxa == "Rodent") %>%
  group_by(taxa, year) %>%
  tally %>%
  collect()

## with SQL syntax
query <- paste("
SELECT a.year, b.taxa,count(*) as count
FROM surveys a
JOIN species b
ON a.species_id = b.species_id
AND b.taxa = 'Rodent'
GROUP BY a.year, b.taxa",
sep = "" )

tbl(mammals, sql(query))

### Challenge

## Write a query that returns the total number of rodents in each
## genus caught in the different plot types.

##  Hint: Write a query that joins the species, plot, and survey
##  tables together.  The query should return counts of genus by plot
##  type.
genus_counts <- left_join(surveys, plots) %>%
  left_join(species) %>%
  group_by(plot_type, genus) %>%
  tally %>%
  collect()
species <- read.csv("data/species.csv")
surveys <- read.csv("data/surveys.csv")
plots <- read.csv("data/plots.csv")
my_db_file <- "portal-database.sqlite"
my_db <- src_sqlite(my_db_file, create = TRUE)
my_db
### Challenge

## Add the remaining species table to the my_db database and run some
## of your queries from earlier in the lesson to verify that you
## have faithfully recreated the mammals database.


