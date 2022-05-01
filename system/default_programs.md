---
title: "Default Programs"
tags: [ "Documentation", "Defaults", "Mime Type" ]
---

Install the package `xdg-utils`.

In general, type these commands with `bash-completion`, and you'll see the right option.

## Ask

Ask what type of application opens an mkv file:

> xdg-mime query default video/mkv

Same with pdf:

> xdg-mime query default application/pdf

## Set

Set the mime type of mp4 videos to mpv.

> xdg-mime default mpv.desktop video/mp4

### Alternative: File

Look in `~/.config/mimeappps.list` to check and set.

