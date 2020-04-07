#!/bin/zsh
# This script compiles Example.tex and created an image of the pdf.
# The two pages are concatenated horizontally.
# They are separated by a 2px black line.
# There is a shadow surrounding the image for better visibility.

# compile LaTeX
pdflatex -output-directory=../ ../Example.tex
# convert each pdf page to an individual png image
# https://aleksandarjakovljevic.com/convert-pdf-images-using-imagemagick/
# https://stackoverflow.com/questions/2322750/replace-transparency-in-png-images-with-white-background
# This does not work with jpg files somehow. So I use -flatten.
# But if I do that I must do it at one page at a time. Fuck that.
convert -density 600 "../Example.pdf[0]" -resize 4096x -quality 100 -flatten Example-0.png
convert -density 600 "../Example.pdf[1]" -resize 4096x -quality 100 -flatten Example-1.png
# add a right border to the left image so that the two pages look separated
convert  Example-0.png -gravity east -background black -splice 1x0 Example-0.png
# concatenate horizontally the two images
convert Example-0.png Example-1.png +append Overview.png
# add a shadow
# https://graphicdesign.stackexchange.com/questions/117272/how-to-add-drop-shadow-to-a-picture-via-cli
convert Overview.png \( +clone -background black -shadow 50x50+0+0 \) +swap -background none -layers merge +repage Overview.png
# clean yourself up
rm Example-0.png
rm Example-1.png
