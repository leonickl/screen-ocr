#!/usr/bin/env python3
import subprocess
import os
import tempfile
strWNtempdir=tempfile.gettempdir()
strWNtmpfile=strWNtempdir+'/temp.jpg'
strWNcom = 'magick import ' + strWNtmpfile
process = subprocess.call([strWNcom], shell=True)
strWNcom = 'magick  ' + strWNtmpfile + ' -contrast-stretch 1% -level 29%,76% -compress jpeg -strip -quality 40% ' + strWNtmpfile
process = subprocess.call([strWNcom], shell=True)
strWNcom = 'tesseract ' + strWNtmpfile + ' stdout -l deu | xclip -in -selection clipboard'
process = subprocess.call(strWNcom,shell=True)
print(strWNtmpfile, os.path.exists(strWNtmpfile))
if os.path.isfile(strWNtmpfile) or os.path.islink(strWNtmpfile):
            os.remove(strWNtmpfile) 
