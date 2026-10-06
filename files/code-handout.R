#' ## Before we start
#' 
#' 
#' ## Introduction to R
#' 
## ----echo=FALSE, purl=TRUE----------------------------------------------------
### Creating objects in R

#' 
#' ### Challenge
#' 
#' What are the values after each statement in the following?
#' 

#' 
## ----echo=FALSE, purl=TRUE----------------------------------------------------
### Challenge
##
## What are the values after each statement in the following?
##
## mass <- 47.5            # mass?
## age  <- 122             # age?
## mass <- mass * 2.0      # mass?
## age  <- age - 20        # age?
## mass_index <- mass/age  # mass_index?

#' 
## ----echo=FALSE, purl=TRUE----------------------------------------------------
### Vectors and data types

#' 
#' ### Challenge
#' 
#' - We've seen that atomic vectors can be of type character,
#'   numeric (or double), integer, and logical. But what happens if we try to mix these types in
#'   a single vector?
#' 
#' - What will happen in each of these examples? (hint: use `class()`
#'   to check the data type of your objects):
#'   
#'   ```r
#'   num_char <- c(1, 2, 3, "a")
#'   num_logical <- c(1, 2, 3, TRUE)
#'   char_logical <- c("a", "b", "c", TRUE)
#'   tricky <- c(1, 2, 3, "4")
#'   ```
#' 
#' - Why do you think it happens?
#' 
#' - How many values in `combined_logical` are `"TRUE"` (as a character) in the
#'   following example (reusing the 2 `..._logical`s from above):
#'   
#'   ```r
#'   combined_logical <- c(num_logical, char_logical)
#'   ```
#' 
#' - You've probably noticed that objects of different types get
#'   converted into a single, shared type within a vector. In R, we
#'   call converting objects from one class into another class
#'   *coercion*. These conversions happen according to a hierarchy,
#'   whereby some types get preferentially coerced into other
#'   types. Can you draw a diagram that represents the hierarchy of how
#'   these data types are coerced?
#' 
## ----echo=FALSE, eval=FALSE, purl=TRUE----------------------------------------
## ## We've seen that atomic vectors can be of type character, numeric, integer, and
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
## 
## ## How many values in `combined_logical` are `"TRUE"` (as a character) in the
## ## following example:
## combined_logical <- c(num_logical, char_logical)
## 
## ## You've probably noticed that objects of different types get
## ## converted into a single, shared type within a vector. In R, we call
## ## converting objects from one class into another class
## ## _coercion_. These conversions happen according to a hierarchy,
## ## whereby some types get preferentially coerced into other types. Can
## ## you draw a diagram that represents the hierarchy of how these data
## ## types are coerced?

#' 
#' ### Challenge (optional){.challenge}
#' 
#' - Can you figure out why `"four" > "five"` returns `TRUE`?
#' 
## ----echo=FALSE, purl=TRUE----------------------------------------------------
### Challenge (optional)
##
## * Can you figure out why `"four" > "five"` returns `TRUE`?

#' 
#' ### Challenge
#' 
#' 1. Using this vector of heights in inches, create a new vector, `heights_no_na`, with the NAs removed.
#' 
#' ```r
#' heights <- c(63, 69, 60, 65, NA, 68, 61, 70, 61, 59, 64, 69, 63, 63, NA, 72, 65, 64, 70, 63, 65)
#' ```
#' 
#' 2. Use the function `median()` to calculate the median of the `heights` vector.
#' 
#' 3. Use R to figure out how many people in the set are taller than 67 inches.
#' 
## ----echo=FALSE, purl=TRUE----------------------------------------------------
## ### Challenge
## 1. Using this vector of heights in inches, create a new vector with the NAs removed.
##
##    heights <- c(63, 69, 60, 65, NA, 68, 61, 70, 61, 59, 64, 69, 63, 63, NA, 72, 65, 64, 70, 63, 65)
##
## 2. Use the function `median()` to calculate the median of the `heights` vector.
##
## 3. Use R to figure out how many people in the set are taller than 67 inches.

#' 
#' ## Starting with data
#' 
## ----echo=FALSE, purl=TRUE----------------------------------------------------
### Loading the survey data

#' 
## ----eval=FALSE, purl=TRUE----------------------------------------------------
## download.file(url = "https://ndownloader.figshare.com/files/2292169",
##               destfile = "data_raw/portal_data_joined.csv")

#' 
#' ### Challenge
#' 
#' Based on the output of `str(surveys)`, can you answer the following
#' questions?
#' 
## ----echo=FALSE, purl=TRUE----------------------------------------------------

## Challenge
## Based on the output of `str(surveys)`, can you answer the following questions?
##
## * What is the class of the object `surveys`?
## * How many rows and how many columns are in this object?


#' 
## ----echo=FALSE, purl=TRUE----------------------------------------------------

## Indexing and subsetting data frames

#' 
#' ### Challenge
#' 
#' 1. Create a `data.frame` (`surveys_200`) containing only the data in
#'   row 200 of the `surveys` dataset.
#' 
#' 2. Notice how `nrow()` gave you the number of rows in a `data.frame`?
#' 
#' - Use that number to pull out just that last row from the `surveys`
#'   dataset.
#' - Compare that with what you see as the last row using `tail()` to
#'   make sure it's meeting expectations.
#' - Pull out that last row using `nrow()` instead of the row number.
#' - Create a new data frame (`surveys_last`) from that last row.
#' 
## ----echo=FALSE, purl=TRUE----------------------------------------------------
### Challenges:
###
### 1. Create a `data.frame` (`surveys_200`) containing only the
###    data in row 200 of the `surveys` dataset.
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
###    `head(surveys)`, keeping just the first through 6th rows of the surveys
###    dataset.


#' 
## ----echo=FALSE, purl=TRUE----------------------------------------------------
### Factors

#' 
## ----purl=TRUE----------------------------------------------------------------
sex <- factor(c("male", "female", "female", "male"))

#' 
#' ### Challenge
#' 
#' 1. Change the columns `taxa` and `genus` in the `surveys` data frame
#'   into a factor.
#' 
#' 2. Using the functions you learned before, can you find out...
#' 
## ----echo=FALSE, purl=TRUE----------------------------------------------------
### Challenges:
###
### 1. Change the columns `taxa` and `genus` in the `surveys` data frame into a 
###    factor.
###
### 2. Using the functions you learned before, can you find out...
###
###      * How many rabbits were observed?
###      * How many different genera are in the `genus` column?


#' 
## ----purl=TRUE----------------------------------------------------------------
year_fct <- factor(c(1990, 1983, 1977, 1998, 1990))
as.numeric(year_fct)               # Wrong! And there is no warning...
as.numeric(as.character(year_fct)) # Works...
as.numeric(levels(year_fct))[year_fct]    # The recommended way.

#' 
## ----purl=TRUE----------------------------------------------------------------
## bar plot of the number of females and males captured during the experiment:
plot(surveys$sex)

#' 
#' ### Challenge
#' 
## ----wrong-order, results="show", echo=FALSE, purl=TRUE-----------------------
## Challenges
##
## * Rename "F" and "M" to "female" and "male" respectively.
## * Now that we have renamed the factor level to "undetermined", can you recreate the
##   barplot such that "undetermined" is first (before "female")

#' 
#' ### Challenge
#' 
#' 1. We have seen how data frames are created when using `read_csv()`,
#'   but they can also be created by hand with the `data.frame()`
#'   function. There are a few mistakes in this hand-crafted
#'   `data.frame`. Can you spot and fix them? Don't hesitate to
#'   experiment!
#' 

#' 
## ----eval=FALSE, purl=TRUE, echo=FALSE----------------------------------------
## ## Challenge:
## ##  There are a few mistakes in this hand-crafted `data.frame`,
## ##  can you spot and fix them? Don't hesitate to experiment!
## animal_data <- data.frame(
##       animal = c(dog, cat, sea cucumber, sea urchin),
##       feel = c("furry", "squishy", "spiny"),
##       weight = c(45, 8 1.1, 0.8)
##       )

#' 
#' 2. Can you predict the class for each of the columns in the following
#'   example? Check your guesses using `str(country_climate)`:
#' 
#' - Are they what you expected? Why? Why not?
#' - What would you need to change to ensure that each column had the
#'   accurate data type?
#' 

#' 
## ----eval=FALSE, purl=TRUE, echo=FALSE----------------------------------------
## ## Challenge:
## ##   Can you predict the class for each of the columns in the following
## ##   example?
## ##   Check your guesses using `str(country_climate)`:
## ##   * Are they what you expected? Why? why not?
## ##   * What would you need to change to ensure that each column had the
## ##     accurate data type?
## country_climate <- data.frame(country = c("Canada", "Panama", "South Africa", "Australia"),
##                                climate = c("cold", "hot", "temperate", "hot/temperate"),
##                                temperature = c(10, 30, 18, "15"),
##                                northern_hemisphere = c(TRUE, TRUE, FALSE, "FALSE"),
##                                has_kangaroo = c(FALSE, FALSE, FALSE, 1))

#' 
#' ## Manipulating, analyzing and exporting data with tidyverse
#' 
#' ### Challenge {.challenge}
#' 
#' Using pipes, subset the `surveys` data to include animals collected before
#' 1995 and retain only the columns `year`, `sex`, and `weight`.
#' 
## ----eval=FALSE, purl=TRUE, echo=FALSE----------------------------------------
## ## Pipes Challenge:
## ##  Using pipes, subset the data to include animals collected
## ##  before 1995, and retain the columns `year`, `sex`, and `weight.`

#' 
#' ### Challenge {.challenge}
#' 
#' Create a new data frame from the `surveys` data that meets the following
#' criteria: contains only the `species_id` column and a new column called
#' `hindfoot_cm` containing the `hindfoot_length` values (currently in mm)
#' converted to centimeters.
#' In this `hindfoot_cm` column, there are no `NA`s and all values are less
#' than 3.
#' 
#' **Hint**: think about how the commands should be ordered to produce this data frame!
#' 
## ----eval=FALSE, purl=TRUE, echo=FALSE----------------------------------------
## ## Mutate Challenge:
## ##  Create a new data frame from the `surveys` data that meets the following
## ##  criteria: contains only the `species_id` column and a new column called
## ##  `hindfoot_cm` containing the `hindfoot_length` values converted to centimeters.
## ##  In this `hindfoot_cm` column, there are no `NA`s and all values are less
## ##  than 3.
## 
## ##  Hint: think about how the commands should be ordered to produce this data frame!

#' 
#' ### Challenge {.challenge}
#' 
#' 1. How many animals were caught in each `plot_type` surveyed?
#' 
#' 2. Use `group_by()` and `summarize()` to find the mean, min, and max hindfoot
#'   length for each species (using `species_id`). Also add the number of
#'   observations (hint: see `?n`).
#' 
#' 3. What was the heaviest animal measured in each year? Return the columns `year`,
#'   `genus`, `species_id`, and `weight`.
#' 
## ----eval=FALSE, purl=TRUE, echo=FALSE----------------------------------------
## ## Count Challenges:
## ##  1. How many animals were caught in each `plot_type` surveyed?
## 
## ##  2. Use `group_by()` and `summarize()` to find the mean, min, and max
## ## hindfoot length for each species (using `species_id`). Also add the number of
## ## observations (hint: see `?n`).
## 
## ##  3. What was the heaviest animal measured in each year? Return the
## ##  columns `year`, `genus`, `species_id`, and `weight`.

#' 
#' ### Challenge {.challenge}
#' 
#' 1. Reshape the `surveys` data frame with `year` as columns, `plot_id`
#'   as rows, and the
#'   number of genera per plot as the values. You will need to summarize before
#'   reshaping, and use the function `n_distinct()` to get the number of unique
#'   genera within a particular chunk of data. It's a powerful function! See
#'   `?n_distinct` for more.
#' 
#' 2. Now take that data frame and `pivot_longer()` it, so each row is a unique
#'   `plot_id` by `year` combination.
#' 
#' 3. The `surveys` data set has
#'   two measurement columns: `hindfoot_length` and `weight`. This makes it
#'   difficult to do things like look at the relationship between mean values of
#'   each measurement per year in different plot types. Let's walk through a
#'   common solution for this type of problem. First, use `pivot_longer()` to create a
#'   dataset where we have a names column called `measurement` and a
#'   `value` column that takes on the value of either `hindfoot_length` or
#'   `weight`. *Hint*: You'll need to specify which columns will be part of the reshape.
#' 
## ----eval=FALSE, purl=TRUE, echo=FALSE----------------------------------------
## ## Reshaping challenges
## 
## ## 1. Reshape the `surveys` data frame with `year` as columns, `plot_id` as rows, and the number of genera per plot as the values. You will need to summarize before reshaping, and use the function `n_distinct()` to get the number of unique genera within a particular chunk of data. It's a powerful function! See `?n_distinct` for more.
## 
## ## 2. Now take that data frame and `pivot_longer()` it, so each row is a unique `plot_id` by `year` combination.
## 
## ## 3. The `surveys` data set has two measurement columns: `hindfoot_length` and `weight`. This makes it difficult to do things like look at the relationship between mean values of each measurement per year in different plot types. Let's walk through a common solution for this type of problem. First, use `pivot_longer()` to create a dataset where we have a names column called `measurement` and a `value` column that takes on the value of either `hindfoot_length` or `weight`. *Hint*: You'll need to specify which columns will be part of the reshape.
## 
## ## 4. With this new data set, calculate the average of each `measurement` in each `year` for each different `plot_type`. Then `pivot_wider()` them into a data set with a column for `hindfoot_length` and `weight`. *Hint*: You only need to specify the names and values columns for `pivot_wider()`.

#' 
## ----eval=FALSE, purl=TRUE, echo=FALSE----------------------------------------
## ### Create the dataset for exporting:
## ##  Start by removing observations for which the `species_id`, `weight`,
## ##  `hindfoot_length`, or `sex` data are missing:
## surveys_complete <- surveys %>%
##     filter(species_id != "",        # remove missing species_id
##            !is.na(weight),                 # remove missing weight
##            !is.na(hindfoot_length),        # remove missing hindfoot_length
##            sex != "")                      # remove missing sex
## 
## ##  Now remove rare species in two steps. First, make a list of species which
## ##  appear at least 50 times in our dataset:
## species_counts <- surveys_complete %>%
##     count(species_id) %>%
##     filter(n >= 50) %>%
##     select(species_id)
## 
## ##  Second, keep only those species:
## surveys_complete <- surveys_complete %>%
##     filter(species_id %in% species_counts$species_id)

#' 
#' ## Data visualization with ggplot2
#' 
## ----echo=FALSE, purl=TRUE----------------------------------------------------
### Data Visualization with ggplot2

#' 
## ----eval=FALSE, purl=TRUE, echo=FALSE----------------------------------------
## ## Create a ggplot and draw it.
## surveys_plot <- ggplot(data = surveys_complete,
##                        aes(x = weight, y = hindfoot_length))
## 
## surveys_plot +
##   geom_point()

#' 
#' ### Challenge (optional)
#' 
#' Scatter plots can be useful exploratory tools for small datasets. For data
#' sets with large numbers of observations, such as the `surveys_complete` data
#' set, overplotting of points can be a limitation of scatter plots. One strategy
#' for handling such settings is to use hexagonal binning of observations. The
#' plot space is tessellated into hexagons. Each hexagon is assigned a color
#' based on the number of observations that fall within its boundaries.  To use
#' hexagonal binning with **`ggplot2`**, first install the R package `hexbin`
#' from CRAN:
#' 
## ----eval=FALSE---------------------------------------------------------------
## install.packages("hexbin")
## library(hexbin)

#' 
#' Then use the `geom_hex()` function:
#' 
## ----eval=FALSE---------------------------------------------------------------
## surveys_plot +
##  geom_hex()

#' 
#' - What are the relative strengths and weaknesses of a hexagonal bin plot
#'   compared to a scatter plot? Examine the above scatter plot and compare it
#'   with the hexagonal bin plot that you created.
#' 
## ----hexbin-challenge, echo=FALSE, eval=FALSE, purl=TRUE----------------------
## ### Challenge with hexbin
## ##
## ## To use the hexagonal binning with **`ggplot2`**, first install the `hexbin`
## ## package from CRAN:
## 
## install.packages("hexbin")
## library(hexbin)
## 
## ## Then use the `geom_hex()` function:
## 
## surveys_plot +
##     geom_hex()
## 
## ## What are the relative strengths and weaknesses of a hexagonal bin
## ## plot compared to a scatter plot?

#' 
#' ### Challenge
#' 
#' Use what you just learned to create a scatter plot of `weight` over
#' `species_id` with the plot types showing in different colors.
#' Is this a good way to show this type of data?
#' 
## ----scatter-challenge, echo=FALSE, eval=FALSE, purl=TRUE---------------------
## ### Challenge with scatter plot:
## ##
## ##  Use what you just learned to create a scatter plot of `weight`
## ## over `species_id` with the plot types showing in different colors.
## ## Is this a good way to show this type of data?

#' 
#' ### Challenges
#' 
#' Boxplots are useful summaries, but hide the *shape* of the distribution. For
#' example, if there is a bimodal distribution, it would not be observed with a
#' boxplot. An alternative to the boxplot is the violin plot (sometimes known as
#' a beanplot), where the shape (of the density of points) is drawn.
#' 
#' - Replace the box plot with a violin plot; see `geom_violin()`.
#' 
#' In many types of data, it is important to consider the *scale* of the
#' observations.  For example, it may be worth changing the scale of the axis to
#' better distribute the observations in the space of the plot.  Changing the scale
#' of the axes is done similarly to adding/modifying other components (i.e., by
#' incrementally adding commands). Try making these modifications:
#' 
#' - Represent weight on the log~~10~~ scale; see `scale_y_log10()`.
#' 
#' So far, we've looked at the distribution of weight within species. Try making
#' a new plot to explore the distribution of another variable within each species.
#' 
#' - Create boxplot for `hindfoot_length`.  Overlay the boxplot layer on a jitter
#'   layer to show actual measurements.
#' 
#' - Add color to the data points on your boxplot according to the plot from which
#'   the sample was taken (`plot_id`).
#' 
#' Hint: Check the class for `plot_id`. Consider changing the class of `plot_id`
#' from integer to factor. Why does this change how R makes the graph?
#' 
## ----boxplot-challenge, eval=FALSE, purl=TRUE, echo=FALSE---------------------
## ## Challenge with boxplots:
## ##  Start with the boxplot we created:
## ggplot(data = surveys_complete, mapping = aes(x = species_id, y = weight)) +
##   geom_jitter(alpha = 0.3, color = "tomato") +
##   geom_boxplot(outlier.shape = NA)
## ## By ordering the geom layers like this, we can make sure that the boxplot is
## ## layered over the jittered points.
## 
## ##  1. Replace the box plot with a violin plot; see `geom_violin()`.
## 
## ##  2. Represent weight on the log10 scale; see `scale_y_log10()`.
## 
## ##  3. Create boxplot for `hindfoot_length` overlaid on a jitter layer.
## 
## ##  4. Add color to the data points on your boxplot according to the
## ##  plot from which the sample was taken (`plot_id`).
## ##  *Hint:* Check the class for `plot_id`. Consider changing the class
## ##  of `plot_id` from integer to factor. Why does this change how R
## ##  makes the graph?
## 

#' 
#' ### Challenge
#' 
#' Use what you just learned to create a plot that depicts how the average weight
#' of each species changes through the years.
#' 
## ----eval=FALSE, purl=TRUE, echo=FALSE----------------------------------------
## ### Plotting time series challenge:
## ##
## ##  Use what you just learned to create a plot that depicts how the
## ##  average weight of each species changes through the years.
## 

#' 
#' ### Challenge
#' 
#' With all of this information in hand, please take another five minutes to either
#' improve one of the plots generated in this exercise or create a beautiful graph
#' of your own. Use the RStudio [**`ggplot2`** cheat sheet](https://posit.co/wp-content/uploads/2022/10/data-visualization-1.pdf)
#' for inspiration.
#' 
#' Here are some ideas:
#' 
#' - See if you can change the thickness of the lines.
#' - Can you find a way to change the name of the legend? What about its labels?
#' - Try using a different color palette (see
#'   [https://r-graphics.org/chapter-colors](https://r-graphics.org/chapter-colors)).
#' 
## ----final-challenge, eval=FALSE, purl=TRUE, echo=FALSE-----------------------
## ### Final plotting challenge:
## ##  With all of this information in hand, please take another five
## ##  minutes to either improve one of the plots generated in this
## ##  exercise or create a beautiful graph of your own. Use the RStudio
## ##  ggplot2 cheat sheet for inspiration:
## ##  https://posit.co/wp-content/uploads/2022/10/data-visualization-1.pdf

#' 
#' ## SQL databases and R
#' 
## ----purl=TRUE, echo=FALSE----------------------------------------------------
## SQL databases and R

#' 
## ----dbplyr-install, eval=FALSE, purl=TRUE------------------------------------
## install.packages(c("dbplyr", "RSQLite"))

#' 
## ----connect, purl=TRUE-------------------------------------------------------
library(dplyr)
library(dbplyr)
mammals <- DBI::dbConnect(RSQLite::SQLite(), "data_raw/portal_mammals.sqlite")

#' 
## ----use-sql-syntax, purl=TRUE------------------------------------------------
tbl(mammals, sql("SELECT year, species_id, plot_id FROM surveys"))

#' 
#' ### Challenge
#' 
#' Write a query that returns the number of rodents observed in each plot in
#' each year.
#' 
#' Hint: Connect to the species table and write a query that joins the species
#' and survey tables together to exclude all non-rodents.
#' The query should return counts of rodents by year.
#' 
#' Optional: Write a query in SQL that will produce the same result. You can join
#' multiple tables together using the following syntax where foreign key refers
#' to your unique id (e.g., `species_id`):
#' 
#' ```sql
#' SELECT table.col, table.col
#' FROM table1 JOIN table2
#' ON table1.key = table2.key
#' JOIN table3 ON table2.key = table3.key
#' ```
#' 
## ----challenge-sql-1, purl=TRUE, echo=FALSE-----------------------------------

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


#' 
#' ### Challenge
#' 
#' Write a query that returns the total number of rodents in each genus caught
#' in the different plot types.
#' 
#' Hint: Write a query that joins the species, plot, and survey tables together.
#' The query should return counts of genus by plot type.
#' 
## ----challenge-sql-2, purl=TRUE, echo=FALSE-----------------------------------
### Challenge

## Write a query that returns the total number of rodents in each
## genus caught in the different plot types.

##  Hint: Write a query that joins the species, plot, and survey
##  tables together.  The query should return counts of genus by plot
##  type.

#' 
## ----data_frames, purl=TRUE---------------------------------------------------
download.file("https://ndownloader.figshare.com/files/3299483",
              "data_raw/species.csv")
download.file("https://ndownloader.figshare.com/files/10717177",
              "data_raw/surveys.csv")
download.file("https://ndownloader.figshare.com/files/3299474",
              "data_raw/plots.csv")
library(tidyverse)
species <- read_csv("data_raw/species.csv")
surveys <- read_csv("data_raw/surveys.csv")
plots <- read_csv("data_raw/plots.csv")

#' 
## ----create_database, purl=TRUE-----------------------------------------------
my_db_file <- "data/portal-database-output.sqlite"
my_db <- src_sqlite(my_db_file, create = TRUE)

#' 
#' ### Challenge
#' 
#' Add the remaining species table to the `my_db` database and run some of your
#' queries from earlier in the lesson to verify that you have
#' faithfully recreated the mammals database.
#' 
## ----challenge-sql-3, purl=TRUE, echo=FALSE-----------------------------------
### Challenge

## Add the remaining species table to the my_db database and run some
## of your queries from earlier in the lesson to verify that you
## have faithfully recreated the mammals database.

#' 
