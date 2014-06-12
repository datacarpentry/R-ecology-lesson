---
layout: lesson
root: ../..
title: Programming with R
---
FIXME: to be written.


# Notes on building the novice R material (Diego Barneche on 28/Mar/2014) - I'll use the starting file numbers as headings

## 00
* I dropped the command print from most lines as this is not necessary in R

## 01
* Do we want to include ggplot here? Isn't it too soon?

## 02
* I dropped `return` from the functions as R does return the last line evaluated within the function regardless. It is not mandatory.
* On line 28. R does not require indentation, so I have modified the text.

## 03
* line 99. Not true. One may choose not to use `{}` if the for loop has one line implemented. Same applies for functions and if statements. Still using `{}` is good common practice.
* In my opinion, this section about lists and changes should be together in object types, first lesson. I think there is something about lists already there. This will allow people to understand better dataframes, and why you can use `[[]]` to extract values for a dataframe just like using `$`. Also, there is no material for `arrays`, and how `matrix` is an special case of `array`.
* Another thing to think about is the looping concept. While `for` loops may be more used in other languages, vectorized operations can be optimized using the `apply` family. `for` loops become handy when sequential calculations depend on the previous one or when things are cumulative. In my experience, the concept of `for` loops is generally harder to teach than `apply` statements.

## 04
* I'd rather write TRUE and FALSE explicitly as good practice, better then T or F because this can cause confusion for people that create objects named T and F. I changed it on line 75.
* Maybe the content from 154 to 161 has a better place in object types?

## 05, 06 & 7
* Apparnetly we need to expand on those. I am not sure how much we want to cover for these topics (defensive programming, testing, version control, knitr), but we recently developed some advanced material that could be used for examples:
[Sydney bootcamps](http://nicercode.github.io/2014-02-18-UTS/lessons/)

## Simple formatting changes
* I think we need to be consistent with the use of dataframe(s) or data frame(s). I have standardized for the second
* I avoid using `df` for data frames as it can get people confused with degrees of freedom. I changed it to `dat` instead.
* I replaced naming objects as existing functions (e.g. summary in 01 file)
* We also need to be consistent with `<-` vs. `=`. I have changed everythin to `<-`

## General comments

* Sarah did an awesome job with this material (thanks again Sarah!). However, I think we want to be a bit more careful here as we do not want to teach people how to use R as if they were using Python. These languages are inherently different and, in my opinion, so is the way of teaching them. The concepts surely remain, but the approaches may be different. For example, you will notice that I have eliminated already the havy use of `print` statements as those are generally not necessary in R (at least not in the examples given). 

* We may have to think of other examples to get people engaged, particularly when dealing with functions. Something that is more realistic to users. Althought the audience can vary a lot, R users in general are after some stats. Giving examples of stats functinos may be an idea.

* The same idea apply for the plotting file. There are many plotting situations that we could use that would be much more within the context of a regular biologists, statistician, whatever. Again, based on a more advanced material Rich FitzJohn and Daniel Falster produced for the Sydney bootcamps: [Plotting lesson](http://nicercode.github.io/2014-02-18-UTS/lessons/10-functions/)

