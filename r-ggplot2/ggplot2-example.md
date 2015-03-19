# Data visualization with ggplot2

## Review

Remember an earlier lesson where we introduced basic plotting commands using built-in data and base plotting tools. For example, we made a few plots using Edgar Anderson's famous iris dataset, which measured petal and sepal length and width for several different species of flower.


```coffee
# Load some data and look at the first few lines
data(iris)
head(iris)
```

```
##   Sepal.Length Sepal.Width Petal.Length Petal.Width Species
## 1          5.1         3.5          1.4         0.2  setosa
## 2          4.9         3.0          1.4         0.2  setosa
## 3          4.7         3.2          1.3         0.2  setosa
## 4          4.6         3.1          1.5         0.2  setosa
## 5          5.0         3.6          1.4         0.2  setosa
## 6          5.4         3.9          1.7         0.4  setosa
```

```coffee

# Make a basic scatter plot
with(iris, plot(Sepal.Length, Petal.Length))
```

![plot of chunk irisbase](figure/irisbase.png)


When we call `plot` in this way, we are using built-in, or **base** graphics. R's base graphics are powerful and nearly infinitely customizable.

## ggplot2

### The Diamonds dataset

Now let's look at a bigger dataset. We're going to be using a data visualization package called **ggplot2** for drawing the plots, and the **ggplot2** package comes with some data we're going to use for this example.

Recall how to install and load packages. Install the package if you haven't already:


```coffee
# Only need to do this once
install.packages("ggplot2")
```


Then load it:


```coffee
library(ggplot2)
```


Now let's load the diamonds dataset and take a look at the first few rows and it's structure with commands we learned previously. To learn more about this dataset you can also run `?diamonds`.


```coffee
data(diamonds)
head(diamonds)
```

```
##   carat       cut color clarity depth table price    x    y    z
## 1  0.23     Ideal     E     SI2  61.5    55   326 3.95 3.98 2.43
## 2  0.21   Premium     E     SI1  59.8    61   326 3.89 3.84 2.31
## 3  0.23      Good     E     VS1  56.9    65   327 4.05 4.07 2.31
## 4  0.29   Premium     I     VS2  62.4    58   334 4.20 4.23 2.63
## 5  0.31      Good     J     SI2  63.3    58   335 4.34 4.35 2.75
## 6  0.24 Very Good     J    VVS2  62.8    57   336 3.94 3.96 2.48
```

```coffee
str(diamonds)
```

```
## 'data.frame':	53940 obs. of  10 variables:
##  $ carat  : num  0.23 0.21 0.23 0.29 0.31 0.24 0.24 0.26 0.22 0.23 ...
##  $ cut    : Ord.factor w/ 5 levels "Fair"<"Good"<..: 5 4 2 4 2 3 3 3 1 3 ...
##  $ color  : Ord.factor w/ 7 levels "D"<"E"<"F"<"G"<..: 2 2 2 6 7 7 6 5 2 5 ...
##  $ clarity: Ord.factor w/ 8 levels "I1"<"SI2"<"SI1"<..: 2 3 5 4 2 6 7 3 4 5 ...
##  $ depth  : num  61.5 59.8 56.9 62.4 63.3 62.8 62.3 61.9 65.1 59.4 ...
##  $ table  : num  55 61 65 58 58 57 57 55 61 61 ...
##  $ price  : int  326 326 327 334 335 336 336 337 337 338 ...
##  $ x      : num  3.95 3.89 4.05 4.2 4.34 3.94 3.95 4.07 3.87 4 ...
##  $ y      : num  3.98 3.84 4.07 4.23 4.35 3.96 3.98 4.11 3.78 4.05 ...
##  $ z      : num  2.43 2.31 2.31 2.63 2.75 2.48 2.47 2.53 2.49 2.39 ...
```


From this we can see this dataset has prices of nearly 54,000 diamonds along with various features about the diamonds, such as the weight, the quality of the cut, the color, the clarity, and measurements of various dimensions.

### Plotting with ggplot2 using `qplot`

If we wanted to do some exploratory data analysis we might start by plotting the price versus the weight of the diamond.


```coffee
with(diamonds, plot(carat, price))
```

![plot of chunk basediamond](figure/basediamond.png)


As we would expect there is definitely a relationship between the size of the diamond and its cost, but how do the other variables (cut, color, clarity) affect the price? We could examine the interrelationships of all these variables using base R graphics, but it could become extremely cumbersome.

**ggplot2** is a widely used R package that extends R's visualization capabilities. It takes the hassle out of things like creating legends, mapping other variables to scales like color, or faceting plots into small multiples. We'll learn about what all these things mean shortly. To start with, let's produce the same plot as before, but this time using **ggplot2**'s `qplot` function. The `qplot` function is a quick and dirty convenience function to use **ggplot2**, and its syntax will be familiar if you're used to the base `plot` function. We'll cover advanced usage with the `ggplot` function later on.


```coffee
qplot(carat, price, data = diamonds)
```

![plot of chunk qplot1](figure/qplot1.png)


The syntax is very similar to R's base graphics where you specify what's on the x and y axes, then give it the name of the data frame you want to use. We see again the strong relationship between the size of the diamond and its price, but the relationship doesn't appear linear. How does the diamond's clarity affect the weight-price relationship?

#### Faceting and scaling

One option we could use is to color-code the points by their clarity. Here, we pass another `col=` argument with the variable we'd like to use for color-coding:


```coffee
qplot(carat, price, data = diamonds, col = clarity)
```

![plot of chunk clarcolor](figure/clarcolor.png)


Examining the plot you can see that poor-clarity diamonds (included, small inclusions, etc) fetch a lower price per carat relative to more clear diamonds (very small inclusions, internally flawless, etc). We can see that **ggplot2** color-codes the points using a sensible default color scheme, and automatically draws a legend on the side for us. This requires a good deal of extra error-prone coding using base graphics.

However, with 54,000 points on this plot, there is a good deal of overplotting that obscures how clarity affects the nature of the weight-price relationship. How else might we visualize this data? This is where a *series of small multiples* is helpful. The idea of *small multiples* was popularized by data visualization expert Edward Tufte. The idea is that you create a large grid of small plots, where each plot shows a particular *facet* of the data. Here, each plot in the grid might be price vs. carat for each particular clarity level. You explain to your audience the axes and how to interpret each plot only once, and the audience will immediately understand the rest of the plots.

This can be accomplished easily using **ggplot2**:


```coffee
qplot(carat, price, data = diamonds, facets = ~clarity)
```

![plot of chunk facetclar](figure/facetclar.png)


Here, the `facets` argument expects a forumla object that's constructed with the `~` operator. Here, we've plotted the price vs. weight separately for each level of clarity. We can see what we suspected before. With dirty diamonds (included, and perhaps small inclusions), the weight-price relationship is linear or slightly quadratic. Large diamonds can be purchased rather cheaply. But for very clear diamonds (internally flawless), the relationship is quadratic or even exponential.

Let's examine the weight-price relationship for various color ratings:


```coffee
qplot(carat, price, data = diamonds, facets = ~color)
```

![plot of chunk facetcol](figure/facetcol.png)


Here we see that for whiter diamonds (D, E, F) the price rises more quickly with increasing weight than for yellower diamonds (H, I, J).

We can further facet the plot across two different categorical variables using the same syntax:


```coffee
qplot(carat, price, data = diamonds, facets = clarity ~ color)
```

![plot of chunk facetclarcol](figure/facetclarcol.png)


Here we see that the price per carat rises very steeply for very white, very clear diamonds, while the relationship is nearly linear for yellower, more flawed diamonds. We can see that a perfect white diamond averages around $15,000 while a yellow included diamond can be had for only around $2,000.

Finally, we can combind both color-coding and faceting in the same plot. Let's use the same faceting scheme as last time, but color the points by the quality of the diamond's cut.


```coffee
qplot(carat, price, data = diamonds, facets = clarity ~ color, col = cut)
```

![plot of chunk facetclarcol_colcut](figure/facetclarcol_colcut.png)


This color-coding reveals that clearer, whiter diamonds *generally* have higher quality cuts, but the relationship doesn't appear strong, visually. Looking down the plot toward clearer diamonds you start to see more "Ideal" cuts than at the top, which are the more included diamonds.

What we've done here in addition to faceting is map a feature of the data (here, the cut quality) onto a scale (here, color). This behavior will work differently depending on whether you're looking at categorical or continuous variables. We can also map features to other *scales* such as `size=`, `shape=`, `linetype=`, or even transparency using `alpha=`. All of these different scales can be combined with each other or with facets, and give you an extremely powerful and easy-to-use graphical toolbox for exploratory data analysis.

#### Exercise

FIXME: Now, install the `xx` package, and load the `xx` dataset. Using the techniques we've learned here, use faceting and scaling options to explore how xx, xx, and xx affect the relationship between xx and xx.

***Note:** This is where the *Teaching Software Carpentry* exercise ends, and where the future expansion begins.*

### ggplot2 and the *Grammar of Graphics*

The **ggplot2** package provides an R implementation of Leland Wilkinson's *Grammar of Graphics* (1999). The *Grammar of Graphics* challenges data analysts to think beyond the garden variety plot types (e.g. scatter-plot, barplot) and the consider the components that make up a plot or graphic, such as how data are represented on the plot (as lines, points, etc.), how variables are mapped to coordinates or plotting shape or colour, what transformation or statistical summary is required, and so on. Specifically, **ggplot2** allows users to build a plot layer-by-layer by specifying:

 * a *geom**, which specifies how the data are represented on the plot (points, lines, bars, etc.),
 * *aesthetics* that map variables in the data to axes on the plot or to plotting size, shape, color, etc.,
 * a *stat*, a statistical transformation or summary of the data applied prior to plotting,
 * *facets*, which we've already seen above, that allow the data to be divided into chunks on the basis of other categorical or continuous variables and the same plot drawn for each chunk.

Because **ggplot2** implements a *layered* grammar of graphics, data points and additional information (scatterplot smoothers, confidence bands, etc.) can be added to the plot via additional layers, each of which utilize further geoms, aesthetics, and stats.

To make the best use of **ggplot2** it helps to understand the grammar and how it affects how plots are produced. In addition, it is important to note that **ggplot2** is not a general-purpose plotting tool-kit; you may not be able to achieve certain plots or additions to a figure of they do not map onto concepts included in the layered grammar.

In the examples above, we used **ggplot2**'s convenience function, `qplot`, because it's syntax should be familiar if you've already used base graphics. The `qplot` function did a lot of stuff for us: it created the plot object, added layers, plotted geoms, mapped features to aesthetics, created facets, and displayed the result. From here out, we'll use the `ggplot` function to build everything ourselves.

The `ggplot` function has two required arguments: the *data* used for creating the plot, and an *aesthetic* mapping to describe how variables in said data are mapped to things we can see on the plot. Let's use `ggplot` to recreate some of the same plots we produced above. First, the simple scatterplot:


```coffee
# Using the qplot convenience function: qplot(carat, price, data = diamonds)

# Using ggplot:
ggplot(diamonds, aes(carat, price)) + geom_point()
```

![plot of chunk ggdiamonds](figure/ggdiamonds.png)


Here, we've built our plot in layers. First, we create a canvas for plotting layers to come using the `ggplot` function, specifying which **data** to use (here, the *diamonds* data frame), and an **aesthetic mapping** of *carat* to the x-axis and *price* to the y-axis. We next add a layer to the plot, specifying a **geom**, or a way of visually representing the aesthetic mapping. Here we're using a point. Instead of using a point, we could use a different geom. Here, let's use [hexagonal binning](http://cran.r-project.org/web/packages/hexbin/vignettes/hexagon_binning.pdf) instead of a point.


```coffee
ggplot(diamonds, aes(carat, price)) + geom_hex()
```

![plot of chunk gghexbin](figure/gghexbin.png)


Here, each bin represents a segment of the plotting surface with lighter blue colors representing more density in that segment. The number of bins can be adjusted as an argument to the `geom_hex()` function. This is one method of solving the overplotting problem we have in this plot without doing any faceting. Another method, here using points again, is to lower the opacity of each point. Here, `alpha=1/5` sets the opacity of each point to 20%. In other words, 5 points would have to overlap to result in a completely solid point. Note that in this case we're not *mapping* the alpha level aesthetic to some other variable as we did above with color -- we're setting it to a static value of 0.20 for all points in the layer.


```coffee
ggplot(diamonds, aes(carat, price)) + geom_point(alpha = 1/5)
```

![plot of chunk gghexbin2](figure/gghexbin2.png)


We can easily add more layers to the plot. For instance, we could add another layer displaying a smoothed conditional mean using the `geom_smooth()` function.


```coffee
ggplot(diamonds, aes(carat, price)) + geom_point() + geom_smooth()
```

![plot of chunk smoothgam](figure/smoothgam.png)


We'll get a message telling us that because we have >1,000 observations we will default to using a generalized additive model. We could easily plot a straight line by specifying that we want a linear model (`method="lm"`) instead of a generalized additive model, the default for large datasets.


```coffee
ggplot(diamonds, aes(carat, price)) + geom_point() + geom_smooth(method = "lm")
```

![plot of chunk smoothlinear](figure/smoothlinear.png)


Getting back to our examples above, using the `ggplot` syntax we can map the color of the points (an aesthetic) onto one of the variables in our dataset.


```coffee
# Using the qplot convenience function: qplot(carat, price, data = diamonds,
# col = clarity) Using ggplot:
ggplot(diamonds, aes(carat, price, col = clarity)) + geom_point()
```

![plot of chunk ggclarcol](figure/ggclarcol.png)


We can also create a faceted plot as we did above using the `ggplot` function adding another layer with `facet_grid`.


```coffee
# Using the qplot convenience function: qplot(carat, price, data = diamonds,
# facets = clarity ~ color) Using ggplot:
ggplot(diamonds, aes(carat, price)) + geom_point() + facet_grid(clarity ~ color)
```

![plot of chunk ggfacet](figure/ggfacet.png)


By combining multiple layers with aesthetic mappings to different scales, **ggplot2** provides a foundation for producing a wide range of statistical graphics beyond simple "named" plots like scatter plots, histograms, bar plots, etc.

How about a stacked histogram, mapping the fill color of the stacked histogram to levels of the *clarity* variable:


```coffee
ggplot(diamonds, aes(price, fill = clarity)) + geom_histogram(position = "fill",
    binwidth = 200)
```

![plot of chunk ggfillhisto](figure/ggfillhisto.png)


Or what about box plots of the price grouped separately by the quality of the cut, color-coded by the color of the diamond, with the price on the y-axis being on the log (base 10) scale? Simple:


```coffee
ggplot(diamonds, aes(cut, price)) + geom_boxplot(aes(fill = color)) + scale_y_log10()
```

![plot of chunk ggboxplots](figure/ggboxplots.png)


Or what about a kernel density plot (think about a smooth histogram) of the diamond's table depth in different semitransparent curves with the color fill mapped to each level of *cut*, all on the same facet limited to depths between 55 and 70, with a title and a proper axis labels? This also shows the syntax of building up a plot one step at a time. We first initialize the plot with `ggplot`, giving it the data we're working with, and aesthetic mappings. We then add a `geom_density` layer, limit the x-axis displayed, and finally give it a title and axis labels. The plot is in the **g** object here; we can simply enter `g` and the plot will be displayed.


```coffee
g <- ggplot(diamonds, aes(depth, fill = cut))
g <- g + geom_density(alpha = 1/4)
g <- g + xlim(55, 70)
g <- g + ggtitle("Table Depths by Cut Quality")
g <- g + xlab("Table Depth") + ylab("Density")
g
```

![plot of chunk ggdepthdensity](figure/ggdepthdensity.png)


Finally, we can save the plot created using the `ggsave` function:


```coffee
ggsave(filename = "~/Desktop/table-depth-density.png", plot = g)
```


There are endless ways to combine aesthetic mappings with different geoms and multiple layers. Read about other **geom**s, mappings, scales, and other layer options at the links below.

## Further **ggplot2** resources

* <http://docs.ggplot2.org/current/>: The official **ggplot2** documentation.
* <http://www.amazon.com/o/ASIN/0387981403/ref=nosim/gettgenedone-20>: The **ggplot2** book, by the developer, Hadley Wickham.
* <https://groups.google.com/forum/#!forum/ggplot2>: The **ggplot2** Google Group (mailing list, discussion forum).
* <https://github.com/swcarpentry/bc/tree/master/intermediate/r/data-visualization>: Intermediate Software Carpentry lesson on data visualization with **ggplot2**.
* <http://learnr.wordpress.com/>: A blog with a good number of posts describing how to reproduce various kind of plots using **ggplot2**.
* <http://stackoverflow.com/questions/tagged/ggplot2>: Thousands of questions and answers tagged with "ggplot2" on Stack Overflow, a programming Q&A site.
