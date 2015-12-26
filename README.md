---
layout: lesson
title: Data carpentry -- Starting with R for data analysis
keywords: ["R", "subset", "data.frame", "read.csv"]
---

This is an introduction to R designed for participants with no programming
experience. These lessons can be taught in 3/4 of a day. They start with some
basic information about R syntax, the RStudio interface, and move through how to
import CSV files, the structure of data.frame, how to deal with factors, how to
add/remove rows and columns, and finish with how to calculate summary statistics
for each level and a very brief introduction to plotting.

> ## Prerequisites
>
> * Having RStudio installed

## Topics

* [Before we start](00-before-we-start.html)
* [Introduction to R](01-intro-to-R.html)
* [Starting with data](02-starting-with-data.html)
* [The `data.frame` class](03-data-frames.html)
* [Aggregating and analyzing data with dplyr](04-dplyr.html)

## Other resources

* [Motivation](motivation.html)

## Organization of the repository

The lessons are written in Rmarkdown. A Makefile generates an html page for each
topic using knitr. In the process, knitr creates an intermediate markdown
file. These are removed by the Makefile to avoid clutter.

The Makefile also generates a "skeleton" file that is intended to be distributed
to the participants. This file includes some of the examples used during
teaching and the titles of the section. It provides a guide that the
participants can fill in as the lesson progresses. It also avoids typos while
typing more complex examples. Each topic generates a skeleton file, and the
files produced are then concatenated to create a single file and the
intermediate files are deleted. To be included in the skeleton file, a chunk of
code needs to have the arguments `purl=TRUE`.
