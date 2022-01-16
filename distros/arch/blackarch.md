---
title: "blackarch"
tags: [ "Documentation", "distros" ]
---

## Basics

List Blackarch Packages

> sudo pacman -Sgg | grep blackarch | cut -d' ' -f2 | sort -u

Install all with 

> sudo pacman -S blackarch

List availalble groups with

> sudo pacman -Sg | grep blackarch | cut -d- -f2

Install a group with

> sudo pacman blackarch-$thing

e.g.

> sudo blackarch-cracker

## Install from Source

First install blackman.

> sudo pacman -S blackman

List categories:

> blackman -l

Then install all from a category with:

> sudo blackman -p [ category ]

Or install from source with:

> sudo blackman -g [ group name]

or 

> sudo blackman -i [ package ]


