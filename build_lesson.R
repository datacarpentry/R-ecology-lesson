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


CheckLinks <- R6::R6Class(
     "CheckLinks", inherit = TicStep,
     public = list(
         run = function() {
         ## ignore JS file not included as part of rmarkdown
         ## ignore email addresses
         ## ignore embedded images
         link_status <- system("linkchecker --ignore-url=external.+js --ignore-url=^mailto: --ignore-url=^data: --no-warnings  --file-output=csv/link_res.csv _site")
         message("linkchecker exit code: ", link_status)
         readLines("link_res.csv", n = 50)
         res_links <- read.table("link_res.csv", sep = ";", header = TRUE, stringsAsFactors = FALSE)
         str(res_links)
         ## this old version of linkchecker is too strict.  Uncomment when newer
         ## ubuntu distro available on Travis or use Docker image to build the
         ## lesson
         # if (link_status > 0)
         #    stop("Some links are broken")
     })
     )

check_links <- function() {
    CheckLinks$new()
}
