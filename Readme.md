Animated examples for BeepBeep
==============================

This repository contains animated image files that illustrate the execution of
various chains of [BeepBeep](https://github.com/liflab/beepbeep-3) processors.
If you don't know what BeepBeep is, please first visit its
[website](https://liflab.github.io/beepbeep-3). Here is an example of one such
animation:

![Animation of CountDecimate in pull mode](example.gif?raw=true)

Eventually, some of these examples may be merged into BeepBeep's Javadoc, but
for now they only exist in this stand-alone repository.

Periodically, a release will bundle all the GIF, PDF and SVG files of all the
examples in their current state.

How does it work?
-----------------

The repository is made of SVG files, which are multi-layer documents that can
be used to create slides with
[inkscapeslidex](https://github.com/sylvainhalle/inkscapeslidex).

### To generate everything

In the `Examples` folder, call:

    make all

### To generate an animated GIF

In the `Examples` folder, call:

    inkscapeslidex --format gif somefile.svg

Where `somefile.svg` is one of the SVG files. The result is a file called
`somefile.gif`, which is an
[animated GIF](https://en.wikipedia.org/wiki/GIF#Animated_GIF) of the slideshow.

### To generate a multi-page PDF

Call:

    inkscapeslidex somefile.svg

Dependencies
------------

- [inkscapeslidex](https://github.com/sylvainhalle/inkscapeslidex)
- [CPDF](https://community.coherentpdf.com/) is optional. It is required to
  create PDFs that start automatically in single-page mode.
- [ImageMagick](https://imagemagick.org/)
- [GNU Make](https://www.gnu.org/software/make/manual/html_node/index.html)

Changing speed and size
-----------------------

- To change the speed of the generated GIFs, modify the value of variable
  `DELAY` in `Examples/tofig.sh`.
- To change the size of the generated PNGs, replace the parameter `-d 64`
  in line 171 of `Examples/svgtopng.py` by another value (64 is the resolution
  in dpi of the exported images).