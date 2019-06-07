# ----------------------------------------------------------------------------
# A simple makefile to generate the PDFs and/or the animated GIFs
# in this repository
# (C) 2019 Sylvain Hallé
#
# Usage: make [all|pdf|gif]
# ----------------------------------------------------------------------------

.DEFAULT_GOAL: pdf

all: pdf gif

pdf: *.pdf
	./tosinglepage.sh

gif: *.gif

%.pdf: %.svg
	inkscapeslide $<

%.gif: %.svg
	./togif.sh $<

.PHONY: clean

clean:
	rm -f *.pdf *.svg

help:
	@echo "Generates the PDFs and the animated GIFs in this folder"
	@echo "Usage: make [all|pdf|gif]"
	@echo ""
	@echo "pdf   Generates/updates the multi-page PDFs (default)"
	@echo "gif   Generates/updates the animated GIFs"
	@echo "all   Generates/updates both"