---
title: "pdf to txt"
tags: [ "Documentation", "data", "pdf", "ocr" ]
---
How to translate pdf book images to text (results are very poor, and will need lots of corrections).

## Dependencies

Search for 'tesseract english' (or whatever language).

Arch: tesseract-data-eng and poppler-utils

## Script

> pdftoppm -png *file*.pdf test

> for x in \*png; do
> tesseract -l eng  "$x" - >> *out*.txt
> done

