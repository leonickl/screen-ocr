# Screenshot OCR

This script allows you to capture a custom screenshot by dragging your mouse, then automatically extracts text from the image using OCR and copies it to your clipboard.

## Features

Select a region of the screen interactively.

Perform OCR on the captured screenshot.

Copy recognized text directly to the clipboard for quick use.

Easily configurable screenshot tool and language settings.

## Requirements

**Screenshot utility:** By default, the script uses gnome-screenshot, but you can replace it with any other tool (e.g., scrot, maim).

**Tesseract OCR:** Make sure Tesseract is installed.

**Language data:** The OCR language is preconfigured as German. To use German, install the language package (e.g., tesseract-data-deu). You can change the language in the code as needed.

## Usage

Run the script.

Drag your mouse to select the area you want to capture.

The extracted text will be copied to your clipboard automatically.

## Shortcut

You can assign a keyboard shortcut to the script in your settings, e. g., `Win + Shift + T` for quick access.
