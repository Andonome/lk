---
title: Creating Torrents
tags: 
- networking
- torrent
requires: networking/transmission.md
---

Check the name of the user running transmission.


```sh
grep transmission /etc/passwd
transuser="$(grep transmission /etc/passwd)"
```
Go to where your data is, and make your that `${transuser}` can read and write 
to that location. 


```ls
namei -lo $(realpath .)
```

Create a torrent of file or directory with the full path:

```sh
dir=Memes
sudo chown -R :transmission ${dir}
transmission-create $(pwd)/${dir}
```

Add a tracker to the torrent, to help others can find you easily:

```sh
transmission-create --comment 'My Memes collection' -t 'udp://tracker.publicbt.com:80' -t 'udp://tracker.openbittorrent.com:80' --anonymize Memes
```

Trackers are not required, but without them it can take a long time for a 
client to find the torrent.

Without the `--anonymize` flag, the torrent file output will have a 'created by' and 'created date'.

## Open Trackers

- <http://tracker2.dler.org:80/announce>
- <udp://tracker.peerfect.org:6969/announce>
- <http://tracker2.dler.org:80/announce>

[List of trackers](https://raw.githubusercontent.com/ngosang/trackerslist/master/trackers_best.txt)

## Verify

Add your torrent and notes its number:

```sh
transmission-remote -a "$file".torrent -w "$(pwd)"
transmission-remote -l
transmission-remote -t "$number" -i
```

The information in the last command shows that it's not verified, so you can verify with `-v`.

```sh
transmission-remote -t "$number" -v
```

If transmission cannot find it, then tell it where to find the torrent:

```sh
transmission-remote -t "$number" --find "$(pwd)"
```

...and of course, make sure the permissions allow transmission to see the target.


```sh
ls -ld "$file"
```

