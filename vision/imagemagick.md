---
title: "imagemagick"
tags: [ "Documentation", "Vision" ]
---
[Source](http://lxlinux.com/imagemagick.html)

Convert jpg to png.

> convert image.jpg image.png

> convert image.jpg -quality 50 image.jpg

'Quality' must be from 1 to 100.

> convert -resize 50% image.jpg image2.jpg

Resizing only changes jpegs.  Change a png with:

> convert input.png png8:out.png

# Invert Colours

> convert input.jpg output.jpg -negate

# Make Images Smaller

> convert image.jpg -resize 25% output.jpg


# Trim images to border

This is generally used for transparrent images.

> convert -trim image.png output.png

Make the white of an image transparrent.

> convert -transparent white -fuzz 10% input.png output.png

The 'fuzz' option tells the computer that 'close to white' is fine.  You might want to use 20% or higher fuzz.


## Dropshadow

> `convert <input file> \( +clone -background black -shadow 50x8+0+5 \) +swap -background none -layers merge +repage <output file>`


# Convert every jpg in directory to png

> mogrify -format png *.jpg

# Printing Words

# Mass convert

This script converts all jpg files in a directory to svg.

```
for i in  *jpg
do convert "$i" $(ls "$i" | sed s#jpg\$#svg#)
done
```

# SVG

The above script has crappy results.
It's better to use potrace.

```
$convert input.jpg output.ppm
$potrace -s output.ppm -o svgout.svg
```

# Writing Words

[docs](https://www.imagemagick.org/Usage/text/)

See your installed fonts:

> convert -list font

Make na image showing day of the week:

> convert -fill blue -font Sauce-Code-Pro-Semibold-Nerd-Font-Complete-Mono -gravity center -pointsize 79 label:$(date +%A) day.png


Make a meme:

> convert inputmemeimage.png -font impact -fill white -pointsize 84 -stroke black -strokewidth 3 -gravity north -annotate +0+20 'TOP MEME TEXT' -gravity south -annotate +0+20 'BOTTOM MEME TEXT' outputmemeimage.png

