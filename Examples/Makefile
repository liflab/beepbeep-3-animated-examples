# ----------------------------------------------------------------------------
# A simple makefile to generate the PDFs and/or the animated GIFs
# in this repository
# (C) 2019-2026 Sylvain Hallé
#
# Usage: make [all|pdf|gif|png|clean]
#
# Basic structure taken from:
# http://nuclear.mutantstargoat.com/articles/make/
# ----------------------------------------------------------------------------

svgs  := $(wildcard *.svg) $(wildcard *.svgz)

bases := $(svgs:.svg=)
bases := $(bases:.svgz=)

pdfs  := $(addsuffix .pdf,$(bases))
gifs  := $(addsuffix .gif,$(bases))
pngs  := $(addsuffix .png,$(bases))

.DEFAULT_GOAL := pdf

%.pdf: %.svg %.svgz
	inkscapeslidex $<

%.gif: %.svg %.svgz
	inkscapeslidex --format gif $<

%.png: %.pdf
	convert -background transparent -density 36 $<[0] $(basename $<).png

.PHONY: clean all pdf gif png

all: pdf gif png

pdf: $(pdfs)

gif: $(gifs)

png: $(pngs)

clean:
	rm -f $(gifs) $(pdfs) $(pngs)

help:
	@echo "Generates the PDFs and the animated GIFs in this folder"
	@echo "Usage: make [all|pdf|gif|clean]"
	@echo ""
	@echo "pdf   Generates the multi-page PDFs (default)"
	@echo "gif   Generates the animated GIFs"
	@echo "all   Generates both PDFs and GIFs"
	@echo "png   Generates PNG thumbnails for each example"
	@echo "clean Removes all files except SVGs"