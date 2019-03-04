library(knitr)

rmd_files <- list.files(pattern = "^[0-9]{2}.+Rmd$")
if (length(rmd_files) < 1) stop("Rmd files are missing")

out_files <- gsub("\\.Rmd$", ".R", rmd_files)
out_files <- file.path(tempdir(), paste0("handout-", out_files))

r_files <- mapply(function(i, o) {
    knitr::purl(i, output = o,  documentation = 0L)
}, rmd_files, out_files)

r_file_content <- lapply(r_files, readLines)

cat(unlist(r_file_content), sep = "\n", file = "code-handout.R")
