---
title: "Newsraft"
tags: [ "data", "RSS" ]
requires: [ "Shell Scripts" ]
---

# Setup

Install newsraft, then:

```sh
mkdir ~/.config/newsraft
echo 'https://codeberg.org/newsraft/newsraft.atom "Newsraft git"' >> ~/.config/newsraft/feeds
newsraft
```

# Commands

Copy the default config file:

```
cp /usr/share/doc/newsraft/example/config ~/.config/newsraft/config

```

Add a line to check the man page while inside the program:

```
bind M exec man newsraft
```

This will fail, because the letter 'M' is taken by `mpv`.

Add this line to take the default link, and place it in a list of videos.

```
bind V mark-read; exec echo "%l" >> ~/.cache/vidlist.txt
```

# Videos

You can get an RSS feed from any YouTube video with this script:

```
#!/bin/sh

CHANNEL_ID="$(curl -s "$1" | tr ',' '\n'  | grep -Po 'channelId":"\K[\w+-]+' | tail -1)"
FEED_URL="https://www.youtube.com/feeds/videos.xml?channel_id=$CHANNEL_ID"
CHANNEL_NAME="$(curl -s "$FEED_URL" | grep -m 1 -Po 'title\>\K[\w\s]+')"

printf '%s "%s"\n' "$FEED_URL" "$CHANNEL_NAME"
```


