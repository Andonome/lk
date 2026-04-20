---
title: imagemagick
tags: 
- vision
---

Convert jpg to png.

```sh
magick image.jpg image.png
```

```sh
magick image.jpg -quality 50 image.jpg
```

'Quality' must be from 1 to 100.

```sh
magick -resize 50% image.jpg image2.jpg
```

Resizing only changes jpegs.  Change a png with:

```sh
magick input.png png8:out.png
```

# Invert Colours

```sh
magick input.jpg output.jpg -negate
```

# Make Images Smaller

```sh
magick image.jpg -resize 25% output.jpg
```


# Trim images to border

This is generally used for transparent images.

```sh
magick -trim image.png output.png
```

Make the white of an image transparent.

```sh
magick -transparent white -fuzz 10% input.png output.png
```

The 'fuzz' option tells the computer that 'close to white' is fine.  You might want to use 20% or higher fuzz.


## Dropshadow

```sh
`magick <input file> \( +clone -background black -shadow 50x8+0+5 \) +swap -background none -layers merge +repage <output file>`
```


# Convert every jpg in directory to png

```sh
mogrify -format png *.jpg
```

# Printing Words

# Mass magick

This script magicks all jpg files in a directory to svg.

```
for i in  *jpg
do magick "$i" $(ls "$i" | sed s#jpg\$#svg#)
done
```

# SVG

The above script has crappy results.
It's better to use potrace.

```
$magick -flatten input.jpg output.ppm
$potrace -s output.ppm -o svgout.svg
```

# Writing Words

[docs](https://www.imagemagick.org/Usage/text/)

See your installed fonts:

```sh
magick -list font
```

Make an image showing day of the week:

```sh
magick -fill blue -font Sauce-Code-Pro-Semibold-Nerd-Font-Complete-Mono -gravity center -pointsize 79 label:$(date +%A) day.png
```


Make a meme:

```sh
magick inputmemeimage.png -font impact -fill white -pointsize 84 -stroke black -strokewidth 3 -gravity north -annotate +0+20 'TOP MEME TEXT' -gravity south -annotate +0+20 'BOTTOM MEME TEXT' outputmemeimage.png
```

