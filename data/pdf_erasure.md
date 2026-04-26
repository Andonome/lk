---
title: PDF Metadata Erasure
tags: 
- metadata
- ghost script
- gs
- pdf
---

You cannot erase pdf metadata with `exiftool` (it only *appends* your changes).
To delete pdf metadata, you'll need `gs`.

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

```sh
gs -o output.pdf -sDEVICE=pdfwrite "$FILE".pdf pdfmark.txt
```
