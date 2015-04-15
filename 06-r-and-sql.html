---
title: "SQL databases and R"
output:
  html_document:
    toc: true
    theme: united
---


Learning goals
------
Students should finish the lesson with the following skills.

* Students will be able to connect to an existing database using R
* Query an existing database through R using queries constructed with variables
* Create a database and populate it from R
* Understand that scripted database interactions enhance reproducibility of analysis


Introduction
---------

Interacting with databases through scripted languages can offer advantages over querying databases via a GUI interface.  A GUI interfaces for your database is easier to use and allows the quick viewing of adhoc queries.  Querying a database with a programatic intreface (in this case R, but it could be any language) are slightly more complicated.  However the trade-off is that data manipulations are preserved in the code.  Aggregations, summaries and other database operations are preserved.  Therefore those pre-analysis data manipulation steps are not lost.

Connecting R to sqlite databases
---------

R can connect to databases through a number of libraries.  In our case we we will use [RSQLite](http://cran.r-project.org/web/packages/RSQLite/index.html) to connect to existing SQLite3 databases.  However you should be able to connect on almost any database in R via JDBC[http://cran.r-project.org/web/packages/RJDBC/index.html](http://cran.r-project.org/web/packages/RJDBC/index.html) or [ODBC](http://cran.r-project.org/web/packages/RODBC/index.html), or specific database libraries (such as we are doing, or [MySQL](http://cran.r-project.org/web/packages/RMySQL/index.html) ).  

To begin these exercises we'll connect to the mammal database you've just created.


```r
library(RSQLite)
```

```
## Loading required package: DBI
```

```r
## Set dbname and driver out of convenience
myDB <- "~/Downloads/portal_mammals.sqlite"
conn <- dbConnect(drv = SQLite(), dbname= myDB)
```

Now you're connected to your database, you can get information about the tables in the database.  While SQLite manager will provide this for you, you'll need to get it yourself with some basic SQL commands

Basic queries
----
You can grab information about all tables like this:


```r
dbGetQuery(conn,"SELECT type, tbl_name  FROM sqlite_master")
```

```
##    type tbl_name
## 1 table  surveys
## 2 table  species
## 3 table    plots
```

`RSQLite` has some functions that easily list basic information about your database and tables. Here you can see the types and names of fields and get a count of records.


```r
dbListTables(conn)
```

```
## [1] "plots"   "species" "surveys"
```

```r
dbListFields(conn,"surveys")
```

```
## [1] "record_id"       "month"           "day"             "year"           
## [5] "plot"            "species_id"      "sex"             "hindfoot_length"
## [9] "weight"
```

```r
dbGetQuery(conn,"SELECT count(*) FROM surveys")
```

```
##   count(*)
## 1    35549
```

Great!  That's all there is to it. You are now connected to your database and know something about the tables in it.  From here you can manipulate it the exact same way you can from SQLite Manager except in a scripted manner. Let's try some basic queries from the previous lesson.  Querying simply takes a connection to a database and query as inputs and returns a dataframe with the results.


```r
q <- 'SELECT DISTINCT year, species_id FROM surveys'
result <-  dbGetQuery(conn,q)
head(result)
```

```
##   year species_id
## 1 1977         NL
## 2 1977         DM
## 3 1977         PF
## 4 1977         PE
## 5 1977         DS
## 6 1977         PP
```



>  **Challenge**
>
> Write a query that gets counts of genus by plot type. If this seems to advanaced, then get counts of genus by plot_id (eliminates of of the joins)

*Answer*

```r
q <- "SELECT d.plot_type , c.genus, count(*)
FROM
(SELECT a.genus, b.plot
FROM species a
JOIN surveys b
ON a.species_id = b.species_id) c
JOIN plots d
ON c.plot = d.plot_id
GROUP BY d.plot_type,c.genus"

result <- dbGetQuery(conn,q)
head(result)
```

```
##   d.plot_type          c.genus count(*)
## 1     Control       Ammodramus        1
## 2     Control Ammospermophilus      125
## 3     Control       Amphispiza       76
## 4     Control          Baiomys        1
## 5     Control      Calamospiza        2
## 6     Control       Callipepla        2
```

All we've done so far is execute the same sorts of queries that can easily be made with a GUI.  Now let's try leveraging some of the power scripted queries.  Imagine you want to know how many rodents were found every other year.  To get this we'll get the range of dates from the database, sequence them by two and make new queries.


```r
yearRange <- dbGetQuery(conn,"SELECT min(year),max(year) from surveys")
years <- seq(yearRange[,1],yearRange[,2],by=2)
```

Next we'll build our query string using the `paste()` function.


```r
q <- paste("
SELECT a.year,b.taxa,count(*) as count
FROM surveys a
JOIN species b
ON a.species_id = b.species_id
AND b.taxa = 'Rodent'
AND a.year in (",
paste(years,collapse=",")
,")
GROUP BY a.year, b.taxa",
sep = "" )
rCount <- dbGetQuery(conn,q)
head(rCount)
```

```
##   year   taxa count
## 1 1977 Rodent   487
## 2 1979 Rodent   658
## 3 1981 Rodent  1394
## 4 1983 Rodent  1594
## 5 1985 Rodent  1398
## 6 1987 Rodent  1618
```

With the nested paste commands we were able to construct a query programatically, without having to type out all the years.  This could also be done with a for loop, especially if the query to be constructed is more complicated.

Building your workflow
------

Up until now we been working with an existing data. However we can use R as way to build up databases from existing flat files.  We'll use data we generate, but you could easily do this with flat files that you read into R.  Here we'll simulate a simple file of 'sites' where you've measured snout vent lengths (svn) of lizards.


```r
svn_lengths <- cbind(data.frame(sample(letters[1:5],500,replace=T)),data.frame(rnorm(500,15,6)))
colnames(svn_lengths) <- c("site","length")
```

We have some data now. Next we'll need to create a database and add it as a table.


```r
myDB <- "~/wkspace/test.db"
myConn <- dbConnect(drv = SQLite(), dbname= myDB)
dbListTables(myConn)
```

```
## [1] "svn"
```
By opening up a connection, you've created a new database.  If you list the tables you'll see that the database is empty. Next we'll add the dataframe we just created to the database.


```r
dbWriteTable(myConn,"svn",svn_lengths)
```

```
## Error: Table svn exists in database, and both overwrite and append are FALSE
```

```r
dbListTables(myConn)
```

```
## [1] "svn"
```

```r
dbGetQuery(myConn,"SELECT * from svn limit 10")
```

```
##    site    length
## 1     d 16.081716
## 2     c 17.655674
## 3     a 21.664778
## 4     c 12.188801
## 5     e 20.487011
## 6     b 11.198332
## 7     e 11.945846
## 8     b 16.349480
## 9     c  9.125534
## 10    d 21.601599
```
  
If you check the location of your database you'll see that data is automatically being written to disk. Not only does R and RSQLite provide easy ways to query existing databases, it also allows you to easily create your own databases from raw data.  Using this method, you can not only store raw data but create linked tables of derived metrics or data from external sources.

>  **Challenge**
>
> Add a new table to the existing database.  Perhaps it's data about the five different sites, or any other table you'd like. Query your database from SQLite manager just to verify that you're adding data.
