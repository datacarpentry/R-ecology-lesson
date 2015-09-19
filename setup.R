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
if (!file.exists("data/plots.csv")) {
    download.file("http://files.figshare.com/1919738/plots.csv",
                  "data/plots.csv")
}
if (!file.exists("data/portal_data_joined.csv")) {
    download.file("http://files.figshare.com/2236372/combined.csv",
                  "data/portal_data_joined.csv")
}

if (!file.exists("data/portal_mammals.sqlite")) {
    download.file("http://files.figshare.com/1919743/portal_mammals.sqlite",
                  "data/portal_mammals.sqlite")
}


## knitr options
library(knitr)
knitr::opts_chunk$set(results='hide', fig.path='img/R-ecology-',
                      comment = "#>")
