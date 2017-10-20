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
         link_status <- system("linkchecker --ignore-url=external.+js --ignore-url=^mailto: --ignore-url=^data: --no-warnings _site")
         message("linkchecker exit code: ", link_status)
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
