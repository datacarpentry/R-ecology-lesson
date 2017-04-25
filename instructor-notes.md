---
layout: lesson
title: Instructor notes
root: .
---

## Dataset

The data used for this lesson are in the figshare repository at: https://doi.org/10.6084/m9.figshare.1314459

This lesson uses mostly `combined.csv`. The 3 other csv files: `plots.csv`,
`species.csv` and `surveys.csv` are only needed for the lesson on databases.

`combined.csv` is downloaded directly in the chapter "Starting with Data" and
does not need to be downloaded before hand. It however requires that there is a
decent internet connection in the room where the workshop is being taught. To
faciliate the download process, the chunk of code that includes the URL where
the csv file lives, and where the file should go and be named is included in the
code handout (see next paragraph). Using this approach ensures that the file
will be where the lesson expects it to be, and teaches good/reproducible
practice of automating the download. If the learners haven't created the `data/`
directory and/or are not in the correct working directory, the `download.file`
command will produce an error. Therefore, it is important to use the stickies at
this point.

## The handout

The [code handout](http://www.datacarpentry.org/R-ecology-lesson/code-handout.R)
(a link to download it is also available on the top bar of the lesson website)
is useful for Data Carpentry workshops. It includes an outline of the lesson
content, the text for the challenges, the links for the files that need to be
downloaded for the lesson, and pieces of code that may be difficult to type for
learners with no programming experience/who are unfamiliar with R's syntax. We
encourage you to distribute it to the learners at the beginning of the
lesson. As an instructor, we encourage you to do the live coding directly in
this file, so the participants can follow along.


### Narrative

#### Before we start

* The main goal here is to help the learners be comfortable with the RStudio
  interface. We use RStudio because it helps make using R more organized and
  user friendly.
* The "Why learning R?" section contains suggestions of what you could tell your
  learners about the benefits of learning R. However, it's best if you can talk
  here about what has worked for you personally.
* The seeking help section is relatively long, and while it's useful to
  demonstrate a couple of ways to get help from within R, you may want to mostly
  point the workshop participants to this useful reference so that they can
  refer to it after the workshop.
* In the "where to ask for help section?", you may want to emphasize the first
  point about how workshops are a great way to create community of learners that
  can help each others during and after the workshop.


#### Intro to R

#### Starting with data

#### Manipulating data with dplyr

#### Visualizing data with ggplot2

#### Using databases from R

* Ideally this lesson is best taught at the end of the workshop to illustrate
  how the tools covered can integrate with each others. Depending on the
  audience, and the pace of the workshop, it can be suitable to be shown as a
  demonstration rather than a typically lesson.
* The explanation of how dplyr's verb syntax is translated into SQL statements,
  and the section on lazyness are optional and don't need to be taught in detail
  during a workshop. They can be useful after a workshop for learners interested
  in learninig more about the topics or for instructors to answer questions from
  the workshop participants.


### Potential issues & solutions

As it stands, the solutions to all the challenges are commented out in the Rmd
files. If you want to double check your answer, you can look at the source code
of the Rmd files on GitHub.

### Technical Tips and Tricks

Show how to use the 'zoom' button to blow up graphs without constantly resizing windows

Sometimes a package will not install, try a different CRAN mirror
- Tools > Global Options > Packages > CRAN Mirror

Alternatively you can go to CRAN and download the package and install from ZIP file
-   Tools > Install Packages > set to 'from Zip/TAR'

### Other Resources
