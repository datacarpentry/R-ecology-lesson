Cheat sheet of functions used in the lessons


**Lesson 1**


`length ( )` # how many elements are in a particular vector
`class ( ) `# the class (the type of element) of an object
`str ( ) `# an overview of the object and the elements it contains 
`c(  ) ` # create vector; add elements to vector
` [  ] `    # extract and subset vector
`%in% ` # to test if a value is found in a vector
`is.na (  ) `# test if there are missing values
`na.omit ( )` # Returns the object with incomplete cases removed

`complete.cases ( )`# elements which are complete cases


**Lesson 2**

`download.file( ) ` #download the CSV file to your computer
`read.csv( ) ` # load csv file into R memory 
`head( ) `# check the top (the first 6 lines) of data .frame
`factor( ) `# create factors
`levels ( ) `# check levels of a factor
`nlevels ( ) `# check number of levels of a factor
`as.numeric(levels( )) ` # convert factors where the levels appear as numbers  to a numeric vector 

**Lesson 3** 

`data.frame ( )`# create data.frame
`dim ( ) ` #check dimension of data frame
`nrow ( ) ` # returns the number of rows
`ncol ( ) `  # returns the number of  columns 
`head ( ) ` # shows the first 6 rows
`tail ( ) ` #shows the last 6 rows
`names( ) ` #returns the column names (synonym of colnames() for data.frame objects)
`rownames( ) ` # returns the row names
`str( ) ` # check structure of the object and information about the class, length and content of each column
`summary( ) `# summary statistics for each column

`seq ( ) ` # generates a sequence of numbers


**Lesson 4**

`install.packages(“dplyr”) `
`library(“dplyr”) ` 
`select ( ) `# select columns of a data frame,
`filter ( ) `# allows you to select a subset of rows in a data frame 
`%>% ` # pipes to select and filter at the same timeo 
`mutate( ) ` #create new columns based on the values in existing columns
`group_by( ) `# split the data into groups, apply some analysis to each group, and then combine the results.
`summarize ( ) ` #collapses each group into a single-row summary of that group 
`tally( )` # counts the total number of records for each category.
`write.csv ( ) ` # save CSV file 

**Lesson 5**

`ggplot2(data=    , aes(x=  , y=))+geom_point( )+facet_wrap ( )+theme_bw( )+theme( ) `


**Lesson 6**

`dbConnect( ) `  # connect to the database

`dbGetQuery (  ) ` # run the query and access data returned in a data.frame object.
`dbListTables( ) ` # list tables
`dbListFields( ) ` # #get list of fields in the table

`dbDisconnect( ) `# Disconnect from the database
`dbWriteTable( ) ` # add the data frame to database







