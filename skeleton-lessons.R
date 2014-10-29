



## surveys <- read.csv(file="data/surveys.csv")



args(read.csv)



## read.csv(file="data/surveys.csv", header=TRUE) # is identical to:
## read.csv("data/surveys.csv", TRUE)



## read.csv(file="data/surveys.csv", header=TRUE) # is identical to:
## read.csv(header=TRUE, file="data/surveys.csv")



## ?barplot



## args(lm)



## ??geom_point



## help.search("kruskal")



dput(head(iris)) # iris is an example data.frame that comes with R



## saveRDS(iris, file="/tmp/iris.rds")



## some_data <- readRDS(file="~/Downloads/iris.rds")



sessionInfo()








### Creating objects (assignments)



















### Vectors and data types




















# Presentation of the survey data











## Exercise
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



## Question: How can you recreate this plot but by having "control"
## being listed last instead of first?
exprmt <- factor(c("treat1", "treat2", "treat1", "treat3", "treat1", "control",
                   "treat1", "treat2", "treat3"))
table(exprmt)
barplot(table(exprmt))










## The data.frame class





example_data <- data.frame(animal=c("dog", "cat", "sea cucumber", "sea urchin"),
                           feel=c("furry", "furry", "squishy", "spiny"),
                           weight=c(45, 8, 1.1, 0.8))
str(example_data)
example_data <- data.frame(animal=c("dog", "cat", "sea cucumber", "sea urchin"),
                           feel=c("furry", "furry", "squishy", "spiny"),
                           weight=c(45, 8, 1.1, 0.8), stringsAsFactors=FALSE)
str(example_data)



## ##  There are a few mistakes in this hand crafted `data.frame`,
## ##  can you spot and fix them? Don't hesitate to experiment!
## author_book <- data.frame(author_first=c("Charles", "Ernst", "Theodosius"),
##                              author_last=c(Darwin, Mayr, Dobzhansky),
##                              year=c(1942, 1970))



## Can you predict the class for each of the columns in the following example?
## Check your guesses using `str(country_climate)`. Are they what you expected?
##  Why? why not?
country_climate <- data.frame(country=c("Canada", "Panama", "South Africa", "Australia"),
                               climate=c("cold", "hot", "temperate", "hot/temperate"),
                               temperature=c(10, 30, 18, "15"),
                               north_hemisphere=c(TRUE, TRUE, FALSE, "FALSE"),
                               has_kangaroo=c(FALSE, FALSE, FALSE, 1))



## Indexing and sequences









### The function `nrow()` on a `data.frame` returns the number of
### rows. Use it, in conjuction with `seq()` to create a new
### `data.frame` called `surveys_by_10` that includes every 10th row
### of the survey data frame starting at row 10 (10, 20, 30, ...)










## subsetting data





## What does the following do? (Try to guess without executing it)
## surveys_DO$month[2] <- 8



##  Use the function `subset` twice to create a `data.frame` that
##  contains all individuals of the species "DM" that were collected
##  in 2002.
##   * How many individuals of the species "DM" were collected in 2002?



## Adding columns





## species <- read.csv("data/species.csv")



surveys_spid_index <- match(surveys$species, species$species_id)
surveys_genera <- species$genus[surveys_spid_index]



surveys <- cbind(surveys, genus=surveys_genera)



## Use the same approach to also include the species names in the
## `surveys` data frame.





## and check out the result
head(surveys)



## Adding rows







## How many columns are now in (1) the `data.frame` `surveys`, (2) the `data.frame`
## `surveys_index`?

































## 1. To determine the number of elements found in a vector, we can use
## use the function `length()` (e.g., `length(surveys$wgt)`). Using `length()`, how
## many animals have not had their weights recorded?

## 2. What is the median weight for the males?

## 3. What is the range (minimum and maximum) weight?

## 4. Bonus question: what is the standard error for the weight? (hints: there is
##    no built-in function to compute standard errors, and the function for the
##    square root is `sqrt()`).



## Statistics across factor levels









## 1. Create new objects to store: the standard deviation, the maximum and minimum
##    values for the weight of each species
## 2. How many species do you have these statistics for?
## 3. Create a new data frame (called `surveys_summary`) that contains as columns:
##    * `species` the 2 letter code for the species names
##    * `mean_wgt` the mean weight for each species
##    * `sd_wgt` the standard deviation for each species
##    * `min_wgt`  the minimum weight for each species
##    * `max_wgt`  the maximum weight for each species





## Plotting











## 1. Create a new plot showing the standard deviation for each species.





## pdf("mean_per_species.pdf")
## barplot(surveys_summary$mean_wgt, horiz=TRUE, las=1,
##         col=c("lavender", "lightblue"), xlab="Weight (g)",
##         main="Mean weight per species")
## dev.off()



