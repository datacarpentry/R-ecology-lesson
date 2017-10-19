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
         ## ignore JS file not included as part of the
         link_status <- system("linkchecker --ignore-url=external.+js --ignore-url=^mailto: --ignore-url=^data:  -r 2 _site")
         if (link_status > 0)
             stop("Some links are broken")
     })
     )

check_links <- function() {
    CheckLinks$new()
}
