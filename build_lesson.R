library(tic)
BuildLesson <- R6::R6Class(
    "BuildLesson", inherit = TicStep,
    public = list(
        run = function() {
        build_status <- system("make all")
        if (build_status > 0)
            stop("Error during building process")
    })
)

build_lesson <- function() {
    BuildLesson$new()
}


CheckLinks <- R6::R6Class(
     "CheckLinks", inherit = TicStep,
     public = list(
       run = function() {
         res <- checker::check_links("_site",
           show_summary = TRUE,
           check_external = TRUE,
           only_with_issues = FALSE,
           ignore_pattern = "site_libs"
         )

         res
       })
)

check_links <- function() {
    CheckLinks$new()
}
