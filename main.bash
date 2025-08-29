#!/usr/bin/env bash

# create temp file
file="$(mktemp /tmp/temp.XXXXXX.jpg)"

# take screenshot (interactive with mouse)
magick import "$file"

# preprocess image for OCR
magick "$file" -contrast-stretch 1% -level 29%,76% -compress jpeg -strip -quality 40% "$file"

# OCR with tesseract (German) and copy to clipboard
tesseract "$file" stdout -l deu | xclip -in -selection clipboard

# show file path + existence
if [[ -f "$file" ]]; then
    echo "$file exists"
else
    echo "$file does not exist"
fi

# cleanup
rm -f "$file"
