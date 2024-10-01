## file structure
if (!file.exists("data_raw")) dir.create("data_raw")

if (!file.exists("data_raw/surveys.csv")) {
    download.file("https://ndownloader.figshare.com/files/2292172",
                  "data_raw/surveys.csv")
}
if (!file.exists("data_raw/species.csv")) {
    download.file("https://ndownloader.figshare.com/files/3299483",
                  "data_raw/species.csv")
}
if (!file.exists("data_raw/plots.csv")) {
    download.file("https://ndownloader.figshare.com/files/3299474",
                  "data_raw/plots.csv")
}
if (!file.exists("data_raw/portal_data_joined.csv")) {
    download.file("https://ndownloader.figshare.com/files/2292169",
                  "data_raw/portal_data_joined.csv")
}

if (!file.exists("data_raw/portal_mammals.sqlite")) {
    download.file("https://ndownloader.figshare.com/files/2292171",
                  "data_raw/portal_mammals.sqlite")
}


## knitr options
library(knitr)
library(methods)
suppressPackageStartupMessages(library(tidyverse))
knitr::opts_chunk$set(results='hide', # fig.path='img/R-ecology-',
                      comment = "#>", purl = FALSE)

### Custom hooks

## hook for challenges answers

# knitr::knit_hooks$set(answer = function(before, options, envir) {
#   if (before) {
#     paste(
#       "<div class=\"accordion\">",
#       "<h3 class=\"toc-ignore\">Answer</h3>",
#       "<div style=\"background: #fff;\">",  sep = "\n")
#   } else {
#     paste("</div>", "</div>", sep = "\n")
#   }
# })

eng_text_answer <- knitr:::eng_html_asset(
                               paste(
                                   "<div class=\"accordion\">",
                                   "<h3 class=\"toc-ignore\">Answer</h3>",
                                   "<div style=\"background: #fff;\">",
                                   "<p>",  sep = "\n"),
                               paste(
                                   "</div>", "</div>", "</p>", sep = "\n"
                               )
                           )

knitr::knit_engines$set(text_answer = eng_text_answer)
