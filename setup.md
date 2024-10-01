---
title: Setup
---

## Preparations

Data Carpentry's teaching is hands-on, and to follow this lesson
learners must have R and RStudio installed on their computers. They also need
to be able to install a number of R packages, create directories, and download
files.

To avoid troubleshooting during the lesson, learners should follow the
instructions below to download and install everything beforehand.
If the computer is managed by their organization's IT department
they might need help from an IT administrator.

### Install R and RStudio

R and RStudio are two separate pieces of software: 

* **R** is a programming language and software used to run code written in R.
* **RStudio** is an integrated development environment (IDE) that makes using R easier. In this course we use RStudio to interact with R. 
  
If you don't already have R and RStudio installed, follow the instructions for your operating system below.
You have to install R before you install RStudio. 

::::::: spoiler

## For Windows

* Download R from the [CRAN website](https://cran.r-project.org/bin/windows/base/release.htm).
* Run the `.exe` file that was just downloaded
* Go to the [RStudio download page](https://www.rstudio.com/products/rstudio/download/#download)
* Under *Installers* select **RStudio x.yy.zzz - Windows Vista/7/8/10** (where x, y, and z represent version numbers)
* Double click the file to install it
* Once it's installed, open RStudio to make sure it works and you don't get any error messages.
  
:::::::::::::::::::::::::

:::::::::::::::: spoiler

## For MacOS

* Download R from the [CRAN website](https://cran.r-project.org/bin/macosx/).
* Select the `.pkg` file for the latest R version
* Double click on the downloaded file to install R
* It is also a good idea to install [XQuartz](https://www.xquartz.org/) (needed by some packages)
* Go to the [RStudio download page](https://www.rstudio.com/products/rstudio/download/#download)
* Under *Installers* select **RStudio x.yy.zzz - Mac OS X 10.6+ (64-bit)** (where x, y, and z represent version numbers)
* Double click the file to install RStudio
* Once it's installed, open RStudio to make sure it works and you don't get any error messages.

::::::::::::::::

::::::: spoiler

## For Linux 

* Download R from the [CRAN website](https://cran.r-project.org/bin/macosx/).
* Select the `.pkg` file for the latest R version
* Double click on the downloaded file to install R
* It is also a good idea to install [XQuartz](https://www.xquartz.org/) (needed by some packages)
* Go to the [RStudio download page](https://www.rstudio.com/products/rstudio/download/#download)
* Under *Installers* select **RStudio x.yy.zzz - Mac OS X 10.6+ (64-bit)** (where x, y, and z represent version numbers)
* Double click the file to install RStudio
* Once it's installed, open RStudio to make sure it works and you don't get any error messages.

::::::::::::::::

### Update R and RStudio

If you already have R and RStudio installed, first check if your R version is up to date:

* When you open RStudio your R version will be printed in the console on the bottom left. Alternatively, you can type `sessionInfo()` into the console. If your R version is 4.0.0 or later, you don't need to update R for this lesson. If your version of R is older than that, download and install the latest version of R from the R project website [for Windows](https://cran.r-project.org/bin/windows/base/), [for MacOS](https://cran.r-project.org/bin/macosx/), or [for Linux](https://cran.r-project.org/bin/linux/)
* It is not necessary to remove old versions of R from your system, but if you wish to do so you can check [How do I uninstall R?](https://cran.r-project.org/bin/windows/base/rw-FAQ.html#How-do-I-UNinstall-R_003f) 
* After installing a new version of R, you will have to reinstall all your packages with the new version. For Windows, there is a package called `installr` that can help you with upgrading your R version and migrate your package library. A similar package called `pacman` can help with updating R packages across
To update RStudio to the latest version, open RStudio and click on 
`Help > Check for Updates`. If a new version is available follow the 
instruction on screen. By default, RStudio will also automatically notify you 
of new versions every once in a while.

::::::::::::::::::::::::::::: callout

The changes introduced by new R versions are usually backwards-compatible. That is, your old code should still work after updating your R version. However, if breaking changes happen, it is useful to know that you can have multiple versions of R installed in parallel and that you can switch between them in RStudio by going to `Tools > Global Options > General > Basic`.

While this may sound scary, it is **far more common** to run into issues due to using out-of-date versions of R or R packages. Keeping up with the latest versions of R, RStudio, and any packages you regularly use is a good practice.

:::::::::::::::::::::::::::::

### Install required R packages

During the course we will need a number of R packages. Packages contain useful R code written by other people. We will use the packages `tidyverse`, and `ratdat`. 

To try to install these packages, open RStudio and copy and paste the following command into the console window (look for a blinking cursor on the bottom left), then press the <kbd>Enter</kbd> (Windows and Linux) or <kbd>Return</kbd> (MacOS) to execute the command.

```r
install.packages(c("tidyverse", "ratdat"))
```

Alternatively, you can install the packages using RStudio's graphical user interface by going to `Tools > Install Packages` and typing the names of the packages separated by a comma.

R tries to download and install the packages on your machine. 

When the installation has finished, you can try to load the packages by pasting the following code into the console:

```r
library(tidyverse)
library(ratdat)
```

If you do not see an error like `there is no package called ‘...’` you are good to go! 

### Updating R packages

Generally, it is recommended to keep your R version and all packages up to date, because new versions bring improvements and important bugfixes. To update the packages that you have installed, click `Update` in the `Packages` tab in the bottom right panel of RStudio, or go to `Tools > Check for Package Updates...` 

You should update **all of the packages** required for the lesson, even if you installed them relatively recently.

Sometimes, package updates introduce changes that break your old code, which can be very frustrating. To avoid this problem, you can use a package called `renv`. It locks the package versions you have used for a given project and makes it straightforward to reinstall those exact package version in a new environment, for example after updating your R version or on another computer. However, the details are outside of the scope of this lesson.

### Download the data

We will download the data directly from R during the lessons. However, if you are expecting problems with the network, it may be better to download the data beforehand and store it on your machine.

The data files for the lesson can be downloaded manually:

 - [cleaned data](../episodes/data/cleaned/surveys_complete_77_89.csv) and 
 - [zip file of raw data](../episodes/data/new_data.zip).

