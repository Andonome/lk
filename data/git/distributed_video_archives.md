---
title: Make a Distributed Video Archive
tags: 
- data
- git
required:
- data/git/setup_git_annex.md
---

# Magnet Links

Install `aria2`.


```sh
link='magnet:?xt=urn:btih:4abed024f77b829a1d08773b00d449f7a42c1ff9&dn=One_Page_Dungeon_2025&tr=udp%3A%2F%2Ftracker.publicbt.com%3A80&tr=udp%3A%2F%2Ftracker.openbittorrent.com%3A80&tr=udp%3A%2F%2Fexplodie.org%3A6969%2Fannounce
git annex addurl "${link}"

```

# YouTube Videos

Install `yt-dlp`.

```sh
vidurl='https://www.youtube.com/shorts/KQrTQcMRg7U'
git config annex.security.allowed-ip-addresses all
git annex addurl "${vidurl}"
git commit -mSexy\ minotaur --file "${name}.mkv"
```

Alternatively, download with the `--fast` option.


```sh
vidurl='https://www.youtube.com/watch?v=pkzVOXKXfQk'
name="AAVE"
git annex addurl --fast "${vidurl}" --file "${name}.webm"
git commit -m"Add ${name}.webm"
```

This records only that the video should exist, and where to get it.

Get this video:


```sh
git annex get "${name}.webm"
```

# Removing Files

You can remove the file and its address like this:

```sh
git annex drop ${file} --from web
git status
```

No changes have been made to the `git` repo, but annex has deleted the file and 
removed its address.

