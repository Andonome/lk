---
title: Brand Name Wallpaper
tags: 
- void
---

To automatically stick the logo onto your background, do these commands in the directory.

Get the void linux logo from wikipedia

```sh
wget https://upload.wikimedia.org/wikipedia/commons/thumb/0/02/Void_Linux_logo.svg/256px-Void_Linux_logo.svg.png?20170131170632
```

Rename it, and resize it (the standard size is too small for most wallpapers)

```sh
convert -resize 200% '256px-Void_Linux_logo.svg.png?20170131170632' void-logo.png
```
Download a pretty wallpaper

```sh
wget http://wallpapercave.com/wp/Wlm9Gv0.jpg
```

Put the void logo on all *jpg and *png images

```sh
for x in *.jpg
	do
	composite -compose multiply -gravity Center void-logo.png "$x" "$x"
done
```

