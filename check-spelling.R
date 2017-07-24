words_to_ignore <- c("AGPL", "Affero", "Arial", "Auriel", "Barneche",
                     "Blischak", "CRAN", "Chihuahuan", "Cmd", "Ctrl",
                     "Debian", "Dropbox", "Esc", "Espoo", "Fournier",
                     "François", "GitHub", "Gitter", "Grolemund",
                     "Hackathon", "Hilmar", "IDE", "Karthik", "Kuzak",
                     "MacOS", "Marek", "Mateusz", "Michonneau",
                     "NESCent", "NONINFRINGEMENT", "NaN", "OSI",
                     "README", "RMarkdown", "RMySQL", "RSQLite",
                     "RStudio", "Rguide", "Rmd", "SQLite", "SWC",
                     "Smorul", "Tibble", "Timelapse", "UNinstall",
                     "URLs", "Ubuntu", "Valone", "Wickham", "XP",
                     "aes", "agpl", "amd", "apps", "args", "arial",
                     "asis", "atx", "aurielfournier", "aut",
                     "autocompletion", "beanplot", "bg", "bibentry",
                     "bibtex", "bibtype", "bigquery", "blog", "br",
                     "bw", "cd", "cheatsheet", "cheatsheets",
                     "commcalls", "pdfs", "ropensci", "rOpenSci",
                     "vimeo", "jimhester", "lintr", "svg", "codeblog",
                     "aquaria", "CoC", "readme", "ln",
                     "colour", "cran", "creativecommons", "csv",
                     "datacarpentry", "de", "destfile", "df", "dir",
                     "doesn", "doi", "dpi", "dpkg", "dplyr", "dput",
                     "ds", "dx", "ensions", "esapubs", "ethz",
                     "europe", "eval", "exe", "exts", "faq",
                     "figshare", "fmichonneau", "geoms", "ggplot",
                     "ggsave", "ggtheme", "ggthemes", "gh", "github",
                     "gitter", "google", "googling", "grey", "hasn",
                     "hexbin", "hindfoot", "hjust", "htm", "http",
                     "https", "hyperlink", "im", "img", "indices",
                     "introR", "io", "isn", "jef", "jonskeet", "kbd",
                     "knitr", "kruskal", "lang", "legalcode", "linux",
                     "listinfo", "lm", "macosx", "magrittr", "mailto",
                     "md", "mit", "mysql", "na", "ncol",
                     "ndownloader", "nlevels", "nrow", "nrows", "num",
                     "nz", "opensource", "org", "packageDescription",
                     "personList", "phylogenetics", "pipermail",
                     "png", "postgres", "postgresql", "pre",
                     "preprocess", "programmatically", "px", "py",
                     "rdocumentation", "rds", "readLines", "readRDS",
                     "reprex", "revolutionanalytics", "rmarkdown",
                     "rstudio", "rw", "saveRDS", "screenshot", "sep",
                     "sessionInfo", "showWarnings", "sml", "sql",
                     "sqlite", "src", "stackoverflow", "str",
                     "stringsAsFactors", "styleguide", "subfolder",
                     "sublicense", "sudo", "tbl", "tbls", "tibble",
                     "tidyverse", "tmp", "ucture", "uk", "usepa",
                     "usr", "ve", "vjust", "wasn", "wiki",
                     "wikipedia", "workflow", "wouldn", "wp", "www",
                     "xfont", "yy", "zzz", "css", "javascript",
                     "screenshots", "tidyr", "extrafont", "wch",
                     "macOS", "xquartz", "XQuartz", "Baiomys",
                     "Chaetodipus", "cor", "gw", "Spermophilus",
                     "lubridate", "POSIXct",  "ymd", "YYYY",
                     "rstudiohelp")

check_spelling <- function(ignore = words_to_ignore) {
    if (suppressPackageStartupMessages(require(hunspell)) &&
        suppressPackageStartupMessages(require(purrr))  &&
        suppressPackageStartupMessages(require(readr))) {
        files <- list.files(pattern = "md$")
        bad_words <- files %>%
            map(function(x) {
                readr::read_lines(x) %>%
                    hunspell::hunspell(format = "text", ignore = c(en_stats, ignore)) %>%
                        unlist() %>%
                        unique() %>%
                        sort()
            })
        names(bad_words) <- files
        return(bad_words)
    } else {
        stop("Install the following packages: ",
             "hunspell, purrr, readr")
    }
}

res <- check_spelling()

with_bad <- map_int(res, length)

if (any(with_bad) > 0) {
    message("Possibly misspelled words: ")
    print(res[with_bad > 0])
} else {
    message("No misspelled words found.")
}
