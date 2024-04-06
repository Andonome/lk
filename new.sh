#!/bin/sh

echo Select a category

category="$(find . -type d -printf '%P\n' | fzy)"

[ ! -d "$category" ] && mkdir "$category"

echo Select a name

read name

filePath="$category/$(echo $name | sed 's/ /_/g').md"

tagsList="$(echo \"$category | sed 's#\/#", "#g')\""

[ -e "$filePath" ] && $EDITOR "$filePath" && exit 0

echo "---
title: \"$name\"
tags: [ $tagsList ]
---

" > "$filePath"

$EDITOR "$filePath"

