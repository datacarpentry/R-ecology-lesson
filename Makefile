
all: pages code-handout.R

skeleton-%.R: %.Rmd _site.yml
	Rscript -e "knitr::purl('$<', output='$@', documentation=0L)"

%.html: %.Rmd _site.yml
	Rscript -e "rmarkdown::render_site(input='$<')"

%.html: %.md
	Rscript -e "rmarkdown::render_site(input='$<')"

code-handout.R: skeleton-00-before-we-start.R skeleton-01-intro-to-r.R skeleton-02-starting-with-data.R skeleton-03-dplyr.R skeleton-04-visualization-ggplot2.R
	for f in $^; do cat $$f; echo "\n"; done > $@
	make clean-skeleton

pages: 00-before-we-start.html 01-intro-to-r.html 02-starting-with-data.html 03-dplyr.html 04-visualization-ggplot2.html 05-r-and-databases.html index.html LICENSE.html CITATION.html
	make clean-md

clean-skeleton:
	-rm skeleton-*-*.R

clean-md:
	-rm *-*.md

clean-html:
	-rm *-*.html

clean: clean-skeleton clean-html clean-md

clean-data:
	-rm -rf data
