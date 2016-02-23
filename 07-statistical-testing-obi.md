---
layout: topic
title: Statistical testing
author: Data Carpentry contributors
minutes: 30
---
> ## Learning Objectives
>
> *   perform basic statistical tests
>
> ## Requirements
> *   dplyr

# What is statistical testing?

A statistical hypothesis is an assumption about a population parameter. This assumption may or may not be true. Hypothesis testing refers to the formal procedures used by statisticians to accept or reject statistical hypotheses.

## Comparing distribution against a reference value (Student's *t*-test, Shapiro-Wilk test,  Wilcoxon test)


One of the animal listed in our survey data is the [white-throated woodrat](http://wildnatureimages.org/sitebuildercontent/sitebuilderpictures/white-throated_woodrat_21738.jpg) (genus:*Neotoma*, species: *albigula*). We know from the literature that in the region where we conducted the survey the average weight of the woodrats is 160g. We want to check if the weight of the woodrats in our survey is comparable to the the data reported in literature.

First step is to create a vector containing all the weights of the woodrats in the survey. We can use dplyr's functions for this:  

```
library(dplyr)

surveys <- read.csv("http://files.figshare.com/2236372/combined.csv")

mysubset <-  surveys %>% filter(genus=="Neotoma", species=="albigula") %>% select(weight)

```
We can explore the data using simple descriptive statistics:

```
> summary(mysubset)
weight     
Min.   : 30.0  
1st Qu.:131.0  
Median :164.0  
Mean   :159.2  
3rd Qu.:189.0  
Max.   :280.0  
NA's   :100   

```

To test the hypothesis that the weight of the woodrats in our survey is comparable to the the data reported in literature we can use the parametric  [**one-sample *t*-test**](https://en.wikipedia.org/wiki/Student's_t-test).

The use of the one-sample *t*-test is possible if some assumptions are meet, and **before performing the test** we want to make sure this is true:

>Assumption \#1: the weight should be a continuous variable  -> this is true!
>
> Assumption \#2: the  data are independent -> this means that the woodrats should not be related, hopefully true!
>
>Assumption \#3: the weight should be  distributed as a normal variable -> we need to check :)

A quick way to check normality would be to visually inspect the weight distribution:

```
hist(mysubset$weight)
qqnorm(mysubset$weight)

```
*See [this post](http://stats.stackexchange.com/questions/101274/how-to-interpret-a-qq-plot) to interpret the qqplot.*

By looking at the plots the weight distribution looks normal but we want to proof it. A common test for normality is the [Shapiro-Wilk](https://en.wikipedia.org/wiki/Shapiro%E2%80%93Wilk_test) test of normality, that is performed in r using the command [`shapiro.test`](https://stat.ethz.ch/R-manual/R-devel/library/stats/html/shapiro.test.html).

```
shapiro.test(mysubset$weight)

        Shapiro-Wilk normality test

data:  mysubset$weight
W = 0.9945, p-value = 0.0003363



```
The test tells us that we will commit an error with probability 0.0003 if we reject the hypothesis that the weight is normal.

This error is very small and therefore we cannot exclude that the distribution is not-normal, in other words, we can't be sure that it is normal.

We should conclude that Assumption \#3 is not met and therefor use a different test.

[Non parametric tests](https://en.wikipedia.org/wiki/Nonparametric_statistics) are more robust to the lack of normality, therefore we can choose to use a non-parametric test equivalent to the *t*-test. This is the **Mann–Whitney *U* test** tests that is performed in R using the command [`wilcox.test`](https://en.wikipedia.org/wiki/Mann%E2%80%93Whitney_U_test):

>Read carerfully the R manual for this test before doing it, as the same command can test a distribution against a reference value or  compare two distributions.

```
wilcox.test(mysubset$weight, mu=160)

        Wilcoxon signed rank test with continuity correction

data:  mysubset$weight
V = 327902.5, p-value = 0.8471
alternative hypothesis: true location is not equal to 160
```

Here set a null hypothesis that the weight of the surveyed woodrats is comparable to the reference value of 160g.

The test tells us that if we don't accept the hull hypothesis we will commit an error with a probability of 84%: we should conclude that the null hypothesis is true, the surveyed woodrats have a weight comparable to what reported in the literature.



## Challenge

Compare the weight of the  [white-throated woodrat](http://wildnatureimages.org/sitebuildercontent/sitebuilderpictures/white-throated_woodrat_21738.jpg) (genus:*Neotoma*, species: *albigula*)  with those of the [Southern grasshopper mouse](http://www.mammalogy.org/uploads/imagecache/library_image/library/1170.jpg) (Genus: *Onychomys*, species: *torridus*,).

Are they similar?

Can you make a plot to show the two distributions?
