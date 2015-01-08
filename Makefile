
all: pages skeleton-lessons.R

skeleton-%.R: %.Rmd
	Rscript -e "knitr::purl('$<', output='$@', documentation=0L)"

%.html: %.Rmd
	Rscript -e "knitr::knit2html('$<')"

index.html: index.md
	pandoc -o $@ $^
	cp index.md README.md

motivation.html: motivation.md
	pandoc -o $@ $^

skeleton-lessons.R: skeleton-00-before-we-start.R skeleton-01-intro-to-R.R skeleton-02-starting-with-data.R skeleton-03-data-frames.R skeleton-04-manipulating-data.R skeleton-05-analyzing-data.R
	for f in $^; do cat $$f; echo "\n"; done > $@
	make clean-skeleton

pages: index.html motivation.html 00-before-we-start.html 01-intro-to-R.html 02-starting-with-data.html 03-data-frames.html 04-manipulating-data.html 05-analyzing-data.html
	make clean-md

clean-skeleton:
	-rm skeleton-*-*.R

clean-md:
	-rm *-*.md

clean-html:
	-rm *.html

clean: clean-skeleton clean-html clean-md
