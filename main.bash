#!/usr/bin/env bash

# check if dependencies exist
which gnome-screenshot
which magick
which tesseract
which xclip

file="$(mktemp /tmp/temp.XXXXXX.jpg)"

# capture a screenshot (interactive: select area with mouse)
gnome-screenshot -a -f "$file"

# preprocess image for OCR
magick "$file" -contrast-stretch 1% -level 29%,76% -compress jpeg -strip -quality 40% "$file"

# OCR with tesseract (German) and copy to clipboard
tesseract "$file" stdout -l deu | xclip -in -selection clipboard

# cleanup
rm -f "$file"
