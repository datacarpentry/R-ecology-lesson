OUTS := $(patsubst %.Rmd,%.md,$(wildcard *.Rmd)) $(patsubst %.Rmd,%.R,$(wildcard *.Rmd)) figure/

all: $(OUTS)

clean:
	rm -rf $(OUTS)

%.md: %.Rmd
	# knit the file to create a markdown file
	Rscript -e 'knitr::knit("$*.Rmd")'
	# change the syntax highlighting to coffee instead of r
	gsed -i 's/```r/```coffee/g' $*.md

%.R: %.Rmd
	Rscript -e 'knitr::purl("$*.Rmd")'
