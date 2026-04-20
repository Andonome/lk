---
title: Download videos
tags: 
- scraping
---
Install `yt-dlp`.

```sh
yt-dlp --write-auto-sub *<URL>*
```

It will default to English, but you can specify another language with the flag --sub-lang:

```sh
youtube-dl --sub-lang sv --write-auto-sub *<URL>*
```

You can list all available subtitles with:

```sh
yt-dlp --list-subs *<URL>*
```

It's also possible to skip the video and only download the subtitle if you add the flag --skip-download:

```sh
yt-dlp --sub-lang sv --write-auto-sub --skip-download *<URL>*
```

## Alternative

Try `yt-dlp` for some additional features and workarounds.
It uses the same flags as yt-dlp.
