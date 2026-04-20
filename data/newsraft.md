---
title: "Newsraft"
tags: [ "data", "RSS" ]
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

set -e

db=~/rec/feeds.rec

rec="${2:-$db}"

[ ! -z "$1" ] || {
    echo "Give me a youtube URL"
    exit 1
}

[ -w "$rec" ] || touch "$rec"

CHANNEL_ID="$(curl -s "$1" | tr ',' '\n'  | grep -Po 'channelId":"\K[\w+-]+' | tail -1)"
URL="https://www.youtube.com/feeds/videos.xml?channel_id=$CHANNEL_ID"
Name="$(curl -s "$URL" | grep -m 1 -Po 'title\>\K[\w\s]+')"

recins --verbose -t Feed -f Name -v "${Name}" -f URL -v "${URL}" -f Category -v Videos -f Rating -v 3 -f Working -v yes "$rec"
```


