---
title: "Make a gif"
tags: [ "vision" ]
---

Split your video into frames.

```sh
d=$(mktemp -d)
cp $vid.mp4 $d
cd $d

ffmpeg -i $vid.mp4 -vf "fps=10, scale=360:-1" frame%04d.png
gifski --fps 10 -o ${out}.gif frame*.png
```

Optimize:

```sh
gifsicle --optimize=3 --lossy=100 -o ${final}.gif ${out}.gif
```

