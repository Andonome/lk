#!/bin/sh
# get the void linux logo from wikipedia
wget https://upload.wikimedia.org/wikipedia/commons/thumb/0/02/Void_Linux_logo.svg/256px-Void_Linux_logo.svg.png?20170131170632
# rename it, and resize it (the standard size is too small for most wallpapers)
convert -resize 200% '256px-Void_Linux_logo.svg.png?20170131170632' void-logo.png
# download a pretty wallpaper
wget http://wallpapercave.com/wp/Wlm9Gv0.jpg

# put the void logo on all *jpg and *png images
for x in *.jpg
	do
	composite -compose multiply -gravity Center void-logo.png "$x" "$x"
done
