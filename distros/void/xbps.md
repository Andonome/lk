---
title: "xbps"
tags: [ "Documentation", "Void" ]
---
## Search

Look for cowsay in the repository:

> xbps-query --repository --search cowsay

Short version:

> xbps-query -Rs cowsay

Search with regex:

> xbps-query --regex -Rs 'cow(s)?\w'

List what's required for cowsay

> xbps-query -x cowsay

What packages are orphaned (i.e. installed as a dependency for another package, which has since been removed)?

> xbps-query -O

Show cowsay's dependencies.

> xbps-query -x cowsay

This shows `perl`.
To see what else depends on perl:

> xbps-query -X perl

List all manually installed software.

> xbps-query -m

## Install

Install cowsay

> xbps-install cowsay

Upgrade current packages.
`-R` looks at repositories, `-s` makes a sloppy search (for rough matches).

> xbps-install -Suv

## Remove/ Uninstall

Remove cowsay

> xbps-remove cowsay

...and all dependencies

> xbps-remove -R cowsay

Remove all orphaned dependencies.

> xbps-remove -o

Show information about cowsay

## Fixes

Reinstall cowsay

> xbps-install -f cowsay

Look for broken packages.

> sudo xbps-pkgdb -a

And if you've found any, you might reconfigure all packages forcefully:

> sudo xbps-reconfigure -af

