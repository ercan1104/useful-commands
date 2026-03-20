#!/bin/sh
for f in *.pdf; do
    gs -sDEVICE=pdfwrite -dCompatibilityLevel=1.4 -dPDFSETTINGS=/ebook \
       -dNOPAUSE -dQUIET -dBATCH \
       -sOutputFile="${f%.*}_compressed.pdf" "$f"
done
