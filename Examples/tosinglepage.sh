#! /bin/bash

# Sets all PDFs found in the folder to open automatically in single-file view

# Trap Ctrl-c and call ctrl_c()
trap ctrl_c INT

tmpdir=$(mktemp -d)
for img in *.pdf
do
	basename=${img##*/}
	echo $basename
	cpdf $img -squeeze -set-page-mode FullScreen -set-page-layout SinglePage -o $tmpdir/$basename
	mv $tmpdir/$basename $img
done
rm -rf $tmpdir

function ctrl_c()
{
  echo "Interrupting"
  rm -rf $tmpdir
}