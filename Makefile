# RMarkdown files
RMD_SRC = $(filter-out README.Rmd, $(wildcard *.Rmd))

all: pages code-handout.R

pages: ${RMD_SRC} _site.yml
	R -q -e 'if (!requireNamespace("remotes", quietly=FALSE)) install.packages("remotes", repos="https://cran.rstudio.com/"); remotes::install_deps()'
	R -q -e 'rmarkdown::render_site()'

code-handout.R: ${RMD_SRC}
	R -q -e 'source("make_code_handout.R")'

check-spelling:
	Rscript -e "source('check-spelling.R')"
