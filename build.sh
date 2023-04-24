#!/bin/sh

mdslides --output-dir ./slides --template ./template.html --index-template ./index-template.html
cp ./src/*.png ./slides
mdbook build
