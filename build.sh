#!/bin/sh

mdslides --output-dir ./slides --template ./template.html
cp ./src/*.png ./slides
mdbook build
