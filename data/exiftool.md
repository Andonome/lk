---
title: "exiftool"
tags: [ "Documentation", "Metadata" ]
---

Find metadata.

```bash
exiftool image.jpg
```

Find info on all images in current directory.

```bash
exiftool -ext .png .
```

You can make this recurring with the -r switch.

And overwrite all metadata:

```bash
exiftool -all= -overwrite_original -ext jpg .
```
(NB: This does not work on pdf data. See [here](pdf_erasure.md) for erasing all pdf data)

Or just GPS data:

```bash
exiftool -gps:all= *.jpg
```

You can also use the imagemagick tool:

```bash
identify -verbose
```



