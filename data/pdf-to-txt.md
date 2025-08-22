---
title: "pdf to txt"
tags: [ "data", "pdf", "ocr" ]
---

How to translate pdfs to text (results are very poor, and will need lots of corrections).

## Dependencies

Search for 'tesseract english' (or whatever language).

Arch: tesseract-data-eng and poppler-utils

## Script

```sh
pdftoppm -png *file*.pdf test
```

```sh
for x in *png; do
    tesseract -l eng  "$x" - >> out.txt
done
```

