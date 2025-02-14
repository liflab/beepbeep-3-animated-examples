# ----------------------------------------------------------------------------
# A simple makefile to generate the PDFs and/or the animated GIFs
# in this repository
# (C) 2019 Sylvain Hallé
#
# Usage: make [all|pdf|gif|png]
#
# Basic structure taken from:
# http://nuclear.mutantstargoat.com/articles/make/
# ----------------------------------------------------------------------------

svgs = $(wildcard *.svg)
pdfs = $(svgs:.svg=.pdf)
gifs = $(svgs:.svg=.gif)
pngs = $(svgs:.svg=.png)

.DEFAULT_GOAL := pdf

%.pdf: %.svg
	inkscapeslide $<

%.gif: %.svg
	./togif.sh $<

%.png: %.pdf
	convert -background transparent -density 36 $<[0] $(basename $<).png

.PHONY: clean all pdf gif png

all: pdf gif png

pdf: $(pdfs)

gif: $(gifs)

png: $(pngs)

clean:
	rm -f $(gifs) $(pdfs)

help:
	@echo "Generates the PDFs and the animated GIFs in this folder"
	@echo "Usage: make [all|pdf|gif]"
	@echo ""
	@echo "pdf   Generates the multi-page PDFs (default)"
	@echo "gif   Generates the animated GIFs"
	@echo "all   Generates both PDFs and GIFs"
	@echo "png   Generates PNG thumbnails for each example"