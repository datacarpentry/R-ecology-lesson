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
facilitate the download process, the chunk of code that includes the URL where
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

## RStudio and Multiple R Installs

Some learners may have previous R installations. On Mac, if a new install
is performed, the learner's system will create a symbolic link, pointing to the
new install as 'Current.' Sometimes this process does not occur, and, even though
a new R is installed and can be accessed via the R console, RStudio does not find it.
The net result of this is that the learner's RStudio will be running an older R install.
This will cause package installations to fail. This can be fixed at the terminal. First,
check for the appropriate R installation in the library;

```
ls -l /Library/Frameworks/R.framework/Versions/
```

We are currently using R 3.4.x. If it isn't there, they will need to install it. If it
is present, you will need to set the symbolic link to Current to point to the 3.4.x 
directory:

```
ln -s /Library/Frameworks/R.framework/Versions/3.4.x /Library/Frameworks/R.framework/Version/Current
```
Then restart RStudio.

## Narrative

### Before we start

* The main goal here is to help the learners be comfortable with the RStudio
  interface. We use RStudio because it helps make using R more organized and
  user friendly.
* The "Why learning R?" section contains suggestions of what you could tell your
  learners about the benefits of learning R. However, it's best if you can talk
  here about what has worked for you personally.
* Go very slowly in the "Getting setup section". Make sure everyone is following
  along (remind learners to use the stickies). Plan with the helpers at this
  point to go around the room, and be available to help. It's important to make
  sure that learners are in the correct working directory, and that they create
  a `data`  (all lowercase) subfolder.
* The seeking help section is relatively long, and while it's useful to
  demonstrate a couple of ways to get help from within R, you may want to mostly
  point the workshop participants to this useful reference so that they can
  refer to it after the workshop.
* In the "where to ask for help section?", you may want to emphasize the first
  point about how workshops are a great way to create community of learners that
  can help each others during and after the workshop.


### Intro to R

* When going over the section on assignments, make
  sure to pause for at least 30 seconds when asking "What do you think is the
  current content of the object weight_lb? 126.5 or 220?". For learners with no
  programming experience, this is a new and important concept.
* Given that the concept of missing data is an important feature of the R
  language, it is worth spending enough time on it.

### Starting with data

The two main goals for this lessons are:

* To make sure that learners are comfortable with working with data frames, and
  can use the bracket notation to select slices/columns
* To expose learners to factors. Their behavior is not necessarily intuitive,
  and so it is important that they are guided through it the first time they are
  exposed to it. The content of the lesson should be enough for learners to
  avoid common mistakes with them.

### Manipulating data with dplyr

* For this lesson make sure that learners are comfortable using pipes.
* There is also sometimes some confusion on what the arguments of `group_by`
  should be.

### Visualizing data with ggplot2

* This lesson is a broad overview of ggplot2 and focuses on (1) getting familiar
  with the layering system of ggplot2, (2) using the argument `group` in the
  `aes()` function, (3) basic customization of the plots.

### Using databases from R

* Ideally this lesson is best taught at the end of the workshop (as a capstone
  example) to illustrate how the tools covered can integrate with each
  others. Depending on the audience, and the pace of the workshop, it can be
  shown as a demonstration rather than a typically lesson.
* The explanation of how dplyr's verb syntax is translated into SQL statements,
  and the section on laziness are optional and don't need to be taught in detail
  during a workshop. They can be useful after a workshop for learners interested
  in learning more about the topics or for instructors to answer questions from
  the workshop participants.


## Potential issues & solutions

As it stands, the solutions to all the challenges are commented out in the Rmd
files. If you want to double check your answer, you can look at the source code
of the Rmd files on GitHub.

## Technical Tips and Tricks

Show how to use the 'zoom' button to blow up graphs without constantly resizing
windows

Sometimes a package will not install, try a different CRAN mirror
- Tools > Global Options > Packages > CRAN Mirror

Alternatively you can go to CRAN and download the package and install from ZIP
file
-   Tools > Install Packages > set to 'from Zip/TAR'

## Other Resources

If you encounter a problem during a workshop, feel free to contact the
maintainers by email
or
[open an issue](https://github.com/datacarpentry/R-ecology-lesson/issues/new).

For a more in-depth coverage of topics of the workshops, you may want to read "[R for Data Science](http://r4ds.had.co.nz/)" by Hadley Wickham and Garrett Grolemund.
