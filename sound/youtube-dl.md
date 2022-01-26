---
title: "youtube-dl"
tags: [ "Documentation", "Sound" ]
---
> youtube-dl --write-auto-sub <URL>

It will default to English, but you can specify another language with the flag --sub-lang:

> youtube-dl --sub-lang sv --write-auto-sub <URL>

You can list all available subtitles with:

> youtube-dl --list-subs <URL>

It’s also possible to skip the video and only download the subtitle if you add the flag --skip-download:

> youtube-dl --sub-lang sv --write-auto-sub --skip-download <URL>

