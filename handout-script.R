


### Creating objects in R

### Vectors and data types
## ## We’ve seen that atomic vectors can be of type character, numeric, integer, and
## ## logical. But what happens if we try to mix these types in a single
## ## vector?
## 
## ## What will happen in each of these examples? (hint: use `class()` to
## ## check the data type of your object)
## num_char <- c(1, 2, 3, 'a')
## 
## num_logical <- c(1, 2, 3, TRUE)
## 
## char_logical <- c('a', 'b', 'c', TRUE)
## 
## tricky <- c(1, 2, 3, '4')
## 
## ## Why do you think it happens?
## 
## ## Can you draw a diagram that represents the hierarchy of the data
## ## types?
# * Can you figure out why `"four" > "five"` returns `TRUE`?


### Presentation of the survey data
## download.file("https://ndownloader.figshare.com/files/2292169",
##               "data/portal_data_joined.csv")

## Challenge
## Based on the output of `str(surveys)`, can you answer the following questions?
## * What is the class of the object `surveys`?
## * How many rows and how many columns are in this object?
## * How many species have been recorded during these surveys?

### Factors
sex <- factor(c("male", "female", "female", "male"))
food <- factor(c("low", "high", "medium", "high", "low", "medium", "high"))
levels(food)
food <- factor(food, levels=c("low", "medium", "high"))
levels(food)
min(food) ## doesn't work
food <- factor(food, levels=c("low", "medium", "high"), ordered=TRUE)
levels(food)
min(food) ## works!
f <- factor(c(1, 5, 10, 2))
as.numeric(f)               ## wrong! and there is no warning...
as.numeric(as.character(f)) ## works...
as.numeric(levels(f))[f]    ## The recommended way.
## The function `plot()` can be used to quickly create a bar plot of a factor.
## For instance, for a factor
exprmt <- factor(c("treat1", "treat2", "treat1", "treat3", "treat1",
		   "control", "treat1", "treat2", "treat3"))
## the code `plot(exprmt)`
## gives you a barplot of the number of observations, as shown below.

## * What determines the order in which the treatments are listed in the plot?
## * How can you recreate this plot with "control" listed last instead
## of first?
plot(exprmt)


## The data.frame class
## Compare the output of these examples, and compare the difference between when
## the data are being read as `character`, and when they are being read as
## `factor`.
example_data <- data.frame(animal=c("dog", "cat", "sea cucumber", "sea urchin"),
                           feel=c("furry", "furry", "squishy", "spiny"),
                           weight=c(45, 8, 1.1, 0.8))
str(example_data)
example_data <- data.frame(animal=c("dog", "cat", "sea cucumber", "sea urchin"),
                           feel=c("furry", "furry", "squishy", "spiny"),
                           weight=c(45, 8, 1.1, 0.8), stringsAsFactors=FALSE)
str(example_data)
## ## Challenge:
## ##  There are a few mistakes in this hand crafted `data.frame`,
## ##  can you spot and fix them? Don't hesitate to experiment!
## author_book <- data.frame(author_first=c("Charles", "Ernst", "Theodosius"),
##                               author_last=c(Darwin, Mayr, Dobzhansky),
##                               year=c(1942, 1970))
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
##  ## Challenge:
##  ##   We introduced you to the `data.frame()` function and `read.csv()`,
##  ##   but what if we are starting with some vectors? The best way to do
##  ##   this is to pass those vectors to the `data.frame()` function, similar
##  ##   to the above.
##  color <- c("red", "green", "blue", "yellow")
##  counts <- c(50, 60, 65, 82)
##  new_datarame <- data.frame(colors = color, counts = counts)
##  ##    Try making your own new data frame from some vectors. You can check
##  ##    the data type of the new object using `class()`.

## Sequences and Subsetting data frames
### Challenges:
### 1. The function `nrow()` on a `data.frame` returns the number of
### rows. Use it, in conjuction with `seq()` to create a new
### `data.frame` called `surveys_by_10` that includes every 10th row
### of the survey data frame starting at row 10 (10, 20, 30, ...)
###
### 2. Create a data.frame containing only the observation from row 1999 of the -->
### surveys dataset.
###
### 3. Notice how `nrow()` gave you the number of rows in a `data.frame`? Use `nrow()`
###   instead of a row number to make a `data.frame` with observations from only the last
###   row of the `surveys` dataset.
###
### 4. Now that you've seen how `nrow()` can be used to stand in for a row index, let's combine
###   that behavior with the `-` notation above to reproduce the behavior of `head(surveys)`
###   excluding the 7th through final row of the `surveys` dataset.


## The dplyr lesson
## ## Pipes Challenge:
## ##  Using pipes, subset the data to include individuals collected
## ##  before 1995, and retain the columns `year`, `sex`, and `weight.`
## 
## ## Mutate Challenge:
## ##  Create a new dataframe from the survey data that meets the following
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


## The ggplot2 lesson
## ## Challenges:
## ##  Start with the boxplot we created:
## ggplot(data = surveys_complete, aes(x = species_id, y = hindfoot_length)) +
##   geom_boxplot(alpha = 0) +
##   geom_jitter(alpha = 0.3, color = "tomato")
## 
## ##  1. Replace the box plot with a violin plot; see `geom_violin()`.
## 
## ##  2. Represent weight on the log10 scale; see `scale_y_log10()`.
## 
## ##  3. Create boxplot for `hindfoot_length`.
## 
## ##  4. Add color to the datapoints on your boxplot according to the
## ##  plot from which the sample was taken (`plot_id`).
## ##  Hint: Check the class for `plot_id`. Consider changing the class
## ##  of `plot_id` from integer to factor. Why does this change how R
## ##  makes the graph?
## 
## ## Plotting time series challenge:
## ##  Use what you just learned to create a plot that depicts how the
## ##  average weight of each species changes through the years.
## 
## ## Final plotting challenge:
## ##  With all of this information in hand, please take another five
## ##  minutes to either improve one of the plots generated in this
## ##  exercise or create a beautiful graph of your own. Use the RStudio
## ##  ggplot2 cheat sheet for inspiration:
## ##  https://www.rstudio.com/wp-content/uploads/2015/08/ggplot2-cheatsheet.pdf
## 


