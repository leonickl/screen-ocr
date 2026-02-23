#!/usr/bin/env bash

missing=()

for cmd in flameshot magick tesseract xclip; do
    if ! command -v "$cmd" &>/dev/null; then
        missing+=("$cmd")
    fi
done

if [ ${#missing[@]} -ne 0 ]; then
    echo "The following commands could not be found:"

    for cmd in "${missing[@]}"; do
        echo "  - $cmd"
    done

    exit 1
fi

file="/tmp/ocr-$(date +%s%N).jpg"

# capture the screenshot
flameshot gui -p "$file" # select this on Wayland
# gnome-screenshot -a -f "$file" # this can be used with X11

# preprocess image for OCR
magick "$file" -contrast-stretch 1% -level 29%,76% -compress jpeg -strip -quality 40% "$file"

# OCR with tesseract (German) and copy to clipboard
tesseract "$file" stdout -l deu | xclip -in -selection clipboard

# cleanup
rm -f "$file"
