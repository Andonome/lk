---
title: exiftool
tags: 
- metadata
- exifdata
---

Find metadata:

```sh
exiftool "$file".jpg
```

Find info on all `.png` images in current directory.

```sh
exiftool -ext .png .
```

You can make this recurring with the -r switch.

And overwrite all metadata:

```sh
exiftool -all= -overwrite_original -ext jpg .
```
(NB: This does not work on pdf data. See [here](pdf_erasure.md) for erasing all pdf data)

Or just GPS data:

```sh
exiftool -gps:all= *.jpg
```

