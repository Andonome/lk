---
title: "pdf to txt"
tags: [ "data", "pdf", "ocr" ]
---
How to translate pdf book images to text (results are very poor, and will need lots of corrections).

## Dependencies

Search for 'tesseract english' (or whatever language).

Arch: tesseract-data-eng and poppler-utils

## Script

```bash
pdftoppm -png *file*.pdf test
```

```bash
for x in \*png; do
    tesseract -l eng  "$x" - >> *out*.txt
done
```

