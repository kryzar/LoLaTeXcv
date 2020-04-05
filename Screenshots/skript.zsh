#!/bin/zsh
# This script compiles Example.tex and created an image of the pdf.
# The two pages are concatenated horizontally.
# They are separated by a 1px black line.
# There is a shadow surrounding the image for better visibility.

# compile LaTeX
pdflatex -output-directory=../ ../Example.tex
# convert each pdf page to an individual jpg image
convert -density 300 ../Example.pdf -quality 100 Example.jpg
# add a right border to the left image so that the two pages look separated
convert  Example-0.jpg -gravity east -background black -splice 1x0 Example-0.jpg
# concatenate horizontally the two images
convert Example-0.jpg Example-1.jpg +append Overview.jpg
# add a shadow
# https://graphicdesign.stackexchange.com/questions/117272/how-to-add-drop-shadow-to-a-picture-via-cli
convert Overview.jpg \( +clone -background black -shadow 60x60+0+0 \) +swap -background none -layers merge +repage Overview.png
# clean yourself up
rm Example-0.jpg
rm Example-1.jpg
rm Overview.jpg
