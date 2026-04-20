---
title: Search Video Audio
tags: 
- data
- video
---

Check subtitles available:

```sh
url='https://videos.domainepublic.net/videos/watch/d9567d5b-1add-477c-bce3-a58cef84c28c'
yt-dlp --list-subs "$url" | grep --max-count=1 '^en'
```

The original language often displays with  `-orig`, e.g. `en-orig (Original)`.

```
Language Formats
ar       vtt
az       vtt
bg       vtt
ca       vtt
cs       vtt
da       vtt
de       vtt
el       vtt
en       vtt
```

Search youtube.com for videos on a topic, and download subtitles:

```sh
url="$(ytfzf -I l "$search" )" && \
yt-dlp --write-subs --sub-format 'ass/srt/best/vtt' --sub-langs "en.*" --skip-download "$url"
```
