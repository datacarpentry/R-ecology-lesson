
all: pages handout-script.R

skeleton-%.R: %.Rmd
	Rscript -e "knitr::purl('$<', output='$@', documentation=0L)"

%.html: %.Rmd
	Rscript -e "rmarkdown::render('$<', output_format=rmarkdown::html_document(toc=TRUE, highlight='tango'))"

index.html: index.md
	pandoc -o $@ $^

motivation.html: motivation.md
	pandoc -o $@ $^

handout-script.R: skeleton-00-before-we-start.R skeleton-01-intro-to-R.R skeleton-02-starting-with-data.R skeleton-03-data-frames.R skeleton-04-dplyr.R
	for f in $^; do cat $$f; echo "\n"; done > $@
	make clean-skeleton

pages: index.html motivation.html 00-before-we-start.html 01-intro-to-R.html 02-starting-with-data.html 03-data-frames.html 04-dplyr.html 05-visualisation-ggplot2.html 06-r-and-sql.html
	make clean-md

clean-skeleton:
	-rm skeleton-*-*.R

clean-md:
	-rm *-*.md

clean-html:
	-rm *.html

clean: clean-skeleton clean-html clean-md
