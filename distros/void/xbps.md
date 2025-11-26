---
title: "xbps"
tags: [ "void" ]
---
## Search

Look for cowsay in the repository:

```sh
xbps-query --repository --search cowsay
```

Short version:

```sh
xbps-query -Rs cowsay
```

Search with regex:

```sh
xbps-query --regex -Rs 'cow(s)?\w'
```

Search for `genfstab`:

```sh
xlocate genfstab
```

List what's required for cowsay

```sh
xbps-query -x cowsay
```

What packages are orphaned (i.e. installed as a dependency for another package, which has since been removed)?

```sh
xbps-query -O
```

Show cowsay's dependencies.

```sh
xbps-query -x cowsay
```

This shows `perl`.
To see what else depends on perl:

```sh
xbps-query -X perl
```

List all manually installed software.

```sh
xbps-query -m
```

## Install

Install cowsay

```sh
xbps-install cowsay
```

Upgrade current packages.
`-R` looks at repositories, `-s` makes a sloppy search (for rough matches).

```sh
xbps-install -Suv
```

## Remove/ Uninstall

Remove cowsay

```sh
xbps-remove cowsay
```

...and all dependencies

```sh
xbps-remove -R cowsay
```

Remove all orphaned dependencies.

```sh
xbps-remove -o
```

Show information about cowsay

## Fixes

Reinstall cowsay

```sh
xbps-install -f cowsay
```

Look for broken packages.

```sh
sudo xbps-pkgdb -a
```

And if you've found any, you might reconfigure all packages forcefully:

```sh
sudo xbps-reconfigure -af
```

