# Screenshot OCR

This script lets you capture a custom screenshot by dragging your mouse, then automatically extracts text from the image using OCR and copies it to your clipboard.

## Installation

### 1. Install the script

Run this command in your terminal to download and set up the script in `~/.local/bin` (create the folder if it doesn’t exist):

```bash
mkdir -p ~/.local/bin && curl -sSL https://github.com/leonickl/screen-ocr/raw/refs/heads/main/main.bash -o ~/.local/bin/socr && chmod +x ~/.local/bin/socr
```

After this, you can run the tool with:

```bash
socr
```

Make sure `~/.local/bin` is in your `$PATH`. On most modern Linux distros, it already is. You can check with:

```bash
echo $PATH
```

---

### 2. Install dependencies

The script relies on the following tools:

* **Screenshot utility**: By default, it uses `gnome-screenshot`. You can swap in another tool (e.g., `scrot`, `maim`, or on macOS `screencapture`).
* **ImageMagick**: Provides the `magick` command for preprocessing screenshots.
* **Tesseract OCR**: Extracts text from the image.
* **Language data**: This script is preconfigured for German. Install the language pack (e.g., `tesseract-ocr-deu` / `tesseract-langpack-deu` / `tesseract-data-deu`). You can change the language in the source code, but in my case also English texts were recognized properly.
* **xclip**: Copies recognized text to the clipboard.

Install them with your package manager:

#### Debian/Ubuntu

```bash
sudo apt update
sudo apt install gnome-screenshot imagemagick tesseract-ocr tesseract-ocr-deu xclip
```

#### Fedora

```bash
sudo dnf install gnome-screenshot ImageMagick tesseract tesseract-langpack-deu xclip
```

#### Arch Linux

```bash
sudo pacman -S gnome-screenshot imagemagick tesseract tesseract-data-deu xclip
```

#### macOS (via Homebrew, using `screencapture` instead of `gnome-screenshot`)

```bash
brew install imagemagick tesseract xclip
```

---

## Usage

1. Run the script with `socr`.
2. Drag your mouse to select the area you want to capture.
3. The recognized text will be copied to your clipboard automatically.
4. For quick access, assign the script to a custom keyboard shortcut in your system settings - e.g. `Win + Shift + T`.
