---
title: "LaTeX Packages"
tags: [ "writing" ]
---

# Warm Up

1. Deep breath.
1. Cup of tea.
1. Remove the old LaTeX junk you've installed.  Search for 'texlive' or 'latex' in your package manager's installed files.
1. Find `tlmgr` in your package manager.

# `tlmgr`

The LaTeX Package manager is known as `tlmgr`, and often resides in `/opt/texlive/${YEAR}/bin/x86_64-linux/tlmgr`.
Double-check the location:

```sh
ls -l /opt/texlive/${YEAR}/bin/x86_64-linux/tlmgr
ls /opt/texlive/${YEAR}/texmf-dist/scripts/texlive/tlmgr.pl 
```

Double-check the year.
It should *not* match the current year, it should match the `texlive`.

## Problems along the Path

You can't use `tlmgr` unless it's in the `$PATH`.

Check if it *is* in the `$PATH` then if it *should* be in the path:

```sh
echo $PATH
grep texlive -r /etc/profile*
```

If `tlmgr` is where it should be, but not in the path, you can add it temporarily:


```sh
export PATH=${PATH}:/opt/texlive/${YEAR}/bin/x86_64-linux
```

...or just reboot.

## Usage

Search packages:


```sh
tlmgr search --global epstopdf
```

Can't find what you need?
Search for a specific file instead:

```sh
tlmgr search --global --file epstopdf-base.sty
sudo tlmgr install epstopdf-pkg
```

## Recommended Packages


```
latexmk
luatex
titletoc
titlesec
multicol
microtype
graphicx
fontspec
makeindex
imakeidx
```

