---
title: "ffmpeg"
tags: [ "Documentation", "Sound" ]
---
# Basics 

ffmpeg -i [input file] output_file.mkv

The input file might be a device, such as a camera.

Play video:

> ffplay file.mp4

#Record screen
Take the format as 'grab the x11 screen'.

> ffmpeg -f x11grab -s [screensize] -i :0.0 out.mkv

Get screensize with

> xrandr -q

or maybe just...

> ffmpeg -f x11grab -s "$(xdpyinfo | grep dimensions | awk '{print $2}')" -i :1.0 out.mkv

#Add default pulse audio
> ffmpeg -f x11grab -s [screensize] -i :0.0 -f alsa -i default out.mkv

For problems, see pavucontrol.

# Random online suggestion
 ffmpeg -video_size "$(xdpyinfo | grep dimensions | awk '{print $2}')" -f x11grab -i :0.0 -f pulse -ac 2 -i default ~/out.mkv

# Rotate

> ffmpeg -i in.mov -vf "transpose=1" out.mov

0 = 90 Counterclockwise and verfical flip (default)
1 = 90 Clockwise
2 = 90 CounterClockwise
3 = 90Clockwise and vertical flip

# Lower Video Quality
A crf quality of 18 is high, while 24 is low quality.

ffmpeg -i input.mp4 -vcodec libx264 -crf 20 output.mp4

# convert 

Check for supported formats:

> ffmpeg -formats

To convert from mkv to mp4 we can use a codec rather than proper conversion.  Both are wrappers around other formats, so this conversion loses less quality than other conversion types.

> ffmpeg -i LostInTranslation.mkv -codec copy LostInTranslation.mp4

Opus to mp3

> ffmpeg -i song.opus song.mp3

> ffmpeg -i video.flv video.mpeg

> ffmpeg -i input.webm -qscale 0 output.mp4

# Video to Audio

> ffmpeg -i input.mp4 -vn output.mp3


# Convert all mkv files to mp4

> for i in *.mkv; do

    > ffmpeg -i "$i" -codec copy "${i%.*}.mp4"

> done


# Change resolution

> ffmpeg -i input.mp4 -filter:v scale=1280:720 -c:a copy output.mp4

Or just crop:

> ffmpeg -i input.mp4 -filter:v "crop=w:h:x:y" output.mp4

Or aspect ratio:

> ffmpeg -i input.mp4 -aspect 16:9 output.mp4

Or trim to start and stop times:

> ffmpeg -i input.mp4 -ss 00:00:50 -codec copy -t 50 output.mp4

Indicate start times with -ss and time with -t in seconds.

Or split a video into parts:

> ffmpeg -i input.mp4 -t 00:00:30 -c copy part1.mp4 -ss 00:00:30 -codec copy part2.mp4


# Compress Video

> ffmpeg -i input.mp4 -vf scale=1280:-1 -c:v libx264 -preset veryslow -crf 24 output.mp4

# Extract Images from Video

-r sets the frame rate, and -f selects the format.

> ffmpeg -i input.mp4 -r 1 -f image2 image-%2d.png

# Add Images to Audio

> $ ffmpeg -loop 1 -i inputimage.jpg -i inputaudio.mp3 -c:v libx264 -c:a aac -strict experimental -b:a 192k -shortest output.mp4

# Create a Video from Multiple Parts

First make a text file indicating all the parts, e.g.

```

file /home/sk/myvideos/part1.mp4
file /home/sk/myvideos/part2.mp4
file /home/sk/myvideos/part3.mp4
file /home/sk/myvideos/part4.mp4

```

Then join with:

> ffmpeg -f concat -i join.txt -c copy output.mp4

# Add Subtitles

> fmpeg -i input.mp4 -i subtitle.srt -map 0 -map 1 -c copy -c:v libx264 -crf 23 -preset veryfast output.mp4

