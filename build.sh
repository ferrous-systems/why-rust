#!/bin/sh

rm -rf ./slides
mkdir ./slides
mkdir ./slides/images
mdslides --output-dir ./slides --template ./template.html --index-template ./index-template.html
cp ./src/images/*.png ./slides/images
mdbook build
