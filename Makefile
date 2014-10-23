
all: index before-we-start intro-to-R starting-with-data workflows

index: index.Rmd
	Rscript -e "knitr::knit2html('$<')"

before-we-start: 00-before-we-start.Rmd
	Rscript -e "knitr::knit2html('$<')"

intro-to-R: 01-intro-to-R.Rmd
	Rscript -e "knitr::purl('$<', output='skeleton-intro-to-R.R', documentation=0L)"
	Rscript -e "knitr::knit2html('$<')"

starting-with-data: 02-starting-with-data.Rmd
	Rscript -e "knitr::purl('$<', output='skeleton-starting-with-data.R', documentation=0L)"
	Rscript -e "knitr::knit2html('$<')"

workflows: 03-workflows.Rmd
	Rscript -e "knitr::purl('$<', output='skeleton-workflows.R', documentation=0L)"
	Rscript -e "knitr::knit2html('$<')"

clean:
	-rm skeleton-*.R
	-rm *.html
