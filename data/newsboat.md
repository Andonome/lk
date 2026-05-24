---
title: newsboat
tags: 
- RSS
- Setup
---
Create the configuration directory before you start, and add at least 1 URL.

```sh
mkdir ~/.config/newsboat
```

```sh
echo 'https://voidlinux.org/atom.xml foss tech' >> ~/.config/newsboat/urls
```

Start `newsboat` and press `r` to load your feed.

To add a feed, you can press `E` to edit that `urls` file.

## Examples of Feeds

`https://www.schneier.com/feed/atom/ infosec news`

The words after the URL - `infosec news` - becomes tags.

You can input a Youtube channel by adding this, with the channel's ID at the end:

`https://www.youtube.com/feeds/videos.xml?channel_id=UCbbsW7_Esx8QZ8PgJ13pGxw vids #1MinFilms`

To get the channel ID without hunting:

```sh
curl *'https://www.youtube.com/@1minfilms'* | grep -oE 'browseId":"U\w+"' | tail | cut -d'"' -f3 
```

You can add arbitrary commands to get an RSS feed.
For example, to get a Gemini feed, install `gemget`, then put this in the configuration file:

`"exec:gemget gemini://alexschroeder.ch:1965/do/blog/rss --output -" gemini rpg`

All gits can be used as RSS feeds:

`https://github.com/isamert/scli/commits/master.atom`

## Commands

- `E` to edit the URLs file
- `R` to reload everything
- `t` to browse by tags
- `n` to mark an item as read
- Ctrl + a to mark everything in a feed as read

## Configuration Options

You can use a macro by pressing comma, then a key.
With this one, you press comma + v to see a video:

`macro v set browser "mpv --ytdl-format=mp4 %u &>/dev/null&"; open-in-browser-and-mark-read`

(this needs `mpv` and `yt-dlp` installed)

Or or `,o` to open an article in w3m:

`macro o set browser "w3m %u"; open-in-browser-and-mark-read ; set browser "w3m %u"`

Add vim-like keys:

> bind-key j next

> bind-key k prev

> bind-key j down article

> bind-key k up article

