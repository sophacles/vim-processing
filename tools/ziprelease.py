import zipfile
import os

# run from $VIMPROCESSING/tools -- fix later
os.chdir("..")
fname = "processing.zip"


zf = zipfile.ZipFile(fname, 'w')

#top level - don't include anything but the dirs
walker = os.walk('.')
root, dirs, files = walker.next()
for root, dirs, files in walker:
    for f in files:
        if f=="tags":
            continue
        addfile = os.path.join(root, f)
        if not ".git" in addfile:
            zf.write(addfile)
zf.close()
