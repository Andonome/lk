---
title: "PDF Metadata Erasure"
tags: [ "Metadata", "Ghost Script" ]
---

Make a text file called 'pdfmark.txt'.


```text
[ /Title ()
/Author ()
/Subject ()
/Creator ()
/ModDate ()
/Producer ()
/Keywords ()
/CreationDate ()
/DOCINFO pdfmark
```

Then run:

```bash
gs -o output.pdf -sDEVICE=pdfwrite "$FILE".pdf pdfmark.txt
```
