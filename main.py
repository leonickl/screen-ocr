#!/usr/bin/env python3

import subprocess
import os
import tempfile

file = tempfile.gettempdir() + '/temp.jpg'

subprocess.call([
    'magick import ' + file
], shell = True)

subprocess.call([
    'magick  ' + file + ' -contrast-stretch 1% -level 29%,76% -compress jpeg -strip -quality 40% ' + file
], shell = True)

subprocess.call([
    'tesseract ' + file + ' stdout -l deu | xclip -in -selection clipboard'
], shell = True)

print(file, os.path.exists(file))

if os.path.isfile(file) or os.path.islink(file):
    os.remove(file)
