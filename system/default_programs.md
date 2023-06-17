---
title: "Default Programs"
tags: [ "Documentation", "Defaults", "Mime Type" ]
---

Install the package `xdg-utils`, then make very liberal use of the tab button.

## Ask

Ask what type of application opens an mkv file:

```bash
xdg-mime query default video/mkv
```

Same with pdf:

```bash
xdg-mime query default application/pdf
```

Ask what file-type `book.pdf` uses.

```bash
xdg-mime query filetype *book.pdf*
```

## Set

Set the mime type of mp4 videos to mpv.

```bash
xdg-mime default mpv.desktop video/mp4
```

You'll need to use the tab key a lot here, and remember many items start with `org`.

You can use an asterisk for everything in a category.

```bash
xdg-mime default org.gnome.font-viewer.desktop font/\*
```

This often won't work as expected, because some fonts will have the type `application` rather than `font`.

