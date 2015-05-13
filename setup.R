## file structure
if (! file.exists("data")) dir.create("data")

if (!file.exists("data/surveys.csv")) {
    download.file("http://files.figshare.com/1919744/surveys.csv",
                  "data/surveys.csv")
}
if (!file.exists("data/species.csv")) {
    download.file("http://files.figshare.com/1919741/species.csv",
                  "data/species.csv")
}

## knitr options
library(knitr)
knitr::opts_chunk$set(results='hide', fig.path='img/R-ecology-')
