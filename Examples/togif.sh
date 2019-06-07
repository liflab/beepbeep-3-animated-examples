#! /bin/bash

# Trap Ctrl-c and call ctrl_c()
trap ctrl_c INT

# Delay in milliseconds between each frame of the animation
DELAY=100

# Explode SVG into multiple PNGs
python svgtopng.py -i $1

# Convert those PNGs into an animated GIF
# We first flatten the images on a white background to avoid an aliasing effect
# on the resulting GIF; this was taken from
# https://www.imagemagick.org/discourse-server/viewtopic.php?t=32121#p146821
(for img in inkscapeslide*.png; do
	convert $img -background white -flatten miff:-
done) | convert -delay $DELAY -dispose previous - -layers optimize ${1%.*}.gif

# Quit
rm -f inkscapeslide*.png

function ctrl_c()
{
  echo "Interrupting"
  rm -f inkscapeslide*.png
}