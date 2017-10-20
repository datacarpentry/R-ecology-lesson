library(tic)
BuildLesson <- R6::R6Class(
    "BuildLesson", inherit = TicStep,
    public = list(
        run = function() {
        build_status <- system("make all")
        if (build_status > 0)
            stop("Error during building process")
        ## we don't need the README file on the website, and the links it
        ## includes might be broken
        file.remove("_site/README.html")
    })
)

build_lesson <- function() {
    BuildLesson$new()
}


format_url_errors <- function(res_links, idx) {
    paste0("  - broken url:", res_links$urlname[idx], "\n",
           "          from:", res_links$parentname[idx], "\n")
}

CheckLinks <- R6::R6Class(
     "CheckLinks", inherit = TicStep,
     public = list(
         run = function() {
         ## ignore JS file not included as part of rmarkdown
         ## ignore email addresses
         ## ignore embedded images
         link_status <- system("linkchecker --ignore-url=external.+js --ignore-url=^mailto: --ignore-url=^data: --no-warnings  --file-output=csv/link_res.csv _site")
         message("linkchecker exit code: ", link_status)
         ## write output to CSV file and check error codes
         ## stop only for 404s
         res_links <- readr::read_delim("link_res.csv", delim = ";", comment = "#")
         unique(res_links$result)
         res_404 <- grepl("^404|^gaierror", res_links$result)
         other_errors <- grepl("error", res_links$result, ignore.case = TRUE)
         if (any(other_errors)) warning("These links might be problematic: \n",
                                        format_url_errors(res_links, other_errors))
         if (any(res_404)) stop("Some links are broken (check log to inspect): \n",
                                format_url_errors(res_links, res_404))
     })
     )

check_links <- function() {
    CheckLinks$new()
}
