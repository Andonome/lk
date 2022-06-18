---
title: "xdg"
tags: [ "Documentation", "Defaults", "System" ]
---

Tab is your friend.

What filetype is this file?

> xdg-mime query filetype *somefile.pdf*

`application/pdf`

Make `application/pdf` open with zathura as default:

> xdg-mime default org.pwmt.zathura.desktop application/pdf

Ask what happens with a filetype:

> xdg-mime query default audio/mp3

