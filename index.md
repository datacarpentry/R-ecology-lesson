---
layout: lesson
root: .
lastupdated: June 23, 2015
contributors: ["Sarah Supp", "John Blischak","Gavin Simpson","Tracy Teal","Greg Wilson","Diego Barneche"," Stephen Turner","Francois Michonneau"]
maintainers: [""]
domain: Ecology
topic: Starting with R for data analysis
software: R
dataurl:
status: Teaching
---

#Data Carpentry {{ page.topic }} for {{ page.domain }}
=======

Data Carpentry's aim is to teach researchers basic concepts, skills,
and tools for working with data so that they can get more done in less
time, and with less pain. The lessons below were designed for those interested
in working with {{page.domain %}} data in {{page.topic %}}.

This is an introduction to R designed for participants with no programming
experience. These lessons can be taught in 3/4 of a day. They start with some
basic information about R syntax, the RStudio interface, and move through how to
import CSV files, the structure of data.frame, how to deal with factors, how to
add/remove rows and columns, and finish with how to calculate summary statistics
for each level and a very brief introduction to plotting.


**Content Contributors: {{page.contributors | join: ', ' %}}**


**Lesson Maintainers: {{page.maintainers | join: ', ' %}}**


**Lesson status: {{ page.status }}**

<!--
  [Information on Lesson Status Categories]()
-->

<!-- ###### INDEX OF LESSONS ON THIS TOPIC ###### -->

## Lessons:




* [Before we start](00-before-we-start.html)
* [Introduction to R](01-intro-to-R.html)
* [Starting with data](02-starting-with-data.html)
* [The `data.frame` class](03-data-frames.html)
* [Aggregating and analyzing data with dplyr](04-dplyr.html)


1. [Lesson 00 Name](00-lesson-00-name.html)
2. [Lesson 01 Name](01-lesson-01-name.html)


## Data

Data files for the lesson are available here: ({{page.dataurl %}})[{{page.dataurl %}}]


### Requirements

Data Carpentry's teaching is hands-on, so participants are encouraged to use
their own computers to insure the proper setup of tools for an efficient workflow.
*These lessons assume no prior knowledge of the skills or tools*, but working
through this lesson requires working copies of the software described below.
To most effectively use these materials, please make sure to install everything
*before* working through this lesson.

{% if page.software == "Python" %}
{% include pythonSetup.html %}
{% elsif page.software == "Spreadsheets" %}
{% include spreadsheetSetup.html %}
{% elsif page.software == "R" %}
{% include rSetup.html %}
{% else %}
{% include anySetup.html %}
{% endif %}

<p><strong>Twitter</strong>: @datacarpentry</p>




