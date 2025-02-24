---
title: "lf - The Light File Manager"
tags: [ "file browser", "TUI" ]
---

## Config File

If you don't have a `~/.config/lf/lfrc` file, you can probably find an example in `/usr/share/examples/lf`.

```bash
cp -r /usr/share/examples/lf ~/.config/
```

Go straight to root with two keys.

```bash
map g/ cd /
```

Have lf open a file with the default program when you press 'o', using the program `mimeo`.

```bash
map o &mimeo $f
```

Change that default text editor to look at the extension first.

```bash
cmd open ${{
    case $(file --mime-type $f -b) in
        application/x-sc) sc-im $fx;;
        text/html) w3m $fx;;
        text/*) $EDITOR $fx;;
        video/*) nohup mpv $fx --really-quiet >/dev/null &;;
        *) nohup $OPENER $fx >/dev/null &;;
    esac
}}
```

The idea here is to use the default `$OPENER` for lf, but first check extensions.
Note the extra `mpv` commands to leave the video to play, without blocking the terminal.

### Interesting Options

You can set the screen ratio with
`set ratios 1:2:3`

That leaves it as a small initial pane, a medium pane, and a large pane for file previews.

### Rename
 
The standard renaming is bad, because you have to re-type the file extension.
Use this instead:

```bash
# rename current file without overwrite
cmd rename %echo 'name: ' ; read name ; extension="${f##*.}" && newname="$name.$extension"; [ "$f" = "$extension" ] && newname="$name"; [ ! -e "$newname" ] && mv "$f" "$newname" || echo file exists
map r push :rename<enter>
```

If you try to rename `image_1.png` with this command, you can type in `cats`, and the result will be `cats.png`.

## Image Previews

First, install `ueberzug` (to show images).
Then clone the lfrun repo.

```bash
git clone https://github.com/cirala/lfimg.git

cd lfimg

sudo make install
```

