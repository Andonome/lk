---
title: "xbps"
tags: [ "Void" ]
---
## Search

Look for cowsay in the repository:

```bash
xbps-query --repository --search cowsay
```

Short version:

```bash
xbps-query -Rs cowsay
```

Search with regex:

```bash
xbps-query --regex -Rs 'cow(s)?\w'
```

List what's required for cowsay

```bash
xbps-query -x cowsay
```

What packages are orphaned (i.e. installed as a dependency for another package, which has since been removed)?

```bash
xbps-query -O
```

Show cowsay's dependencies.

```bash
xbps-query -x cowsay
```

This shows `perl`.
To see what else depends on perl:

```bash
xbps-query -X perl
```

List all manually installed software.

```bash
xbps-query -m
```

## Install

Install cowsay

```bash
xbps-install cowsay
```

Upgrade current packages.
`-R` looks at repositories, `-s` makes a sloppy search (for rough matches).

```bash
xbps-install -Suv
```

## Remove/ Uninstall

Remove cowsay

```bash
xbps-remove cowsay
```

...and all dependencies

```bash
xbps-remove -R cowsay
```

Remove all orphaned dependencies.

```bash
xbps-remove -o
```

Show information about cowsay

## Fixes

Reinstall cowsay

```bash
xbps-install -f cowsay
```

Look for broken packages.

```bash
sudo xbps-pkgdb -a
```

And if you've found any, you might reconfigure all packages forcefully:

```bash
sudo xbps-reconfigure -af
```

