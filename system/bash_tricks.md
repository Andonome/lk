---
title: "bash_tricks"
tags: [ "Documentation", "System" ]
---
# Automatic mp3 Tagging

/u/OneTurnMore on Reddit:

> !/usr/bin/env bash
> IFS=$'\n'
> for f in $(find . -type f); do
    > id3tool $f -t $(basename $f | cut -d- -f3 | sed 's/\.[^\,]*$//')
> done

One can also use

> sed s/\,[^\.]*$//

... in order to avoid multiple full stops messing up syntax.

We can use `\.` as a literal full stop.

`[^ ]` means anything other than the containing character, so `[^\.]` would mean `anything other than a full stop'.

`*` in sed means this character is repeated any number of times, including 0, so files with no `.` character would still be processed fine.

`$` means `end of the line'.

Apparently sed uses `regex, not globing'.

Regular expressions (``regex'') looks for patterns and is used with find and grep.  It interprets `*' as a wildcard, `?' as a single-character wildcard, and [12,1,2] as characters matching one of a set (in this case, `12 or 1 or 2 but not 21'].

If the shell is set to find file ``a*b.txt'' then it will pass this first to regex, and hit items like `aab.txt' and `abb.txt'.  If it finds nothing, it'll then use globbing, and interpret `a*b.txt' literally.

# Alias Expansion

> echo '"\C- ": shell-expand-line' >> ~/.inputrc

Reload bash, and you can use Ctrl+Space to expand an alias.
Type in `ll` (or any alias), then Ctrl+Space.

# Automatic Renaming

There are a bunch of files:

* Column CV.aux
* Column CV.log
* Column CV.out
* Column CV.pdf
* Column CV.tex
* tccv.cls

Goal: swap the word ``Column'' for ``Malin'' in all files.

> IFS=$'\n'

> for f in $(find . -name "Col*"); do

> mv "$f" $(echo "$f" | sed s/Column/Malin/)

> done

IFS is the field separator.  This is required to denote the different files as marked by a new line, and not the spaces.

# Arguments and Input

The `rm' program takes arguments, but not `stdin' from a keyboard, and therefore programs cannot pipe results into rm.

That said, we can sometimes pipe into rm with `xargs rm' to turn the stdin into an argument.  For example, if we have a list of files called `list.txt' then we could use cat as so:

> cat list.txt | xargs rm

... *However*, this wouldn't work if spaces were included, as rm would take everything literally.

# Numbers

Add number to variables with:

* > let "var=var+1"
* > let "var+=1"
* > let "var++"
* > ((++var))
* > ((var=var+1))
* > ((var+=1))
* > var=$(expr $var + 1)

((n--)) works identically.

# Finding Duplicate Files


> find . -type f -exec md5sum '{}' ';' | sort | uniq --all-repeated=separate -w 15 > all-files.txt

... add blank line to top of first file.

> awk '/^$/{getline;print;}' all-files.txt > uniq.txt

> diff all-files.txt uniq.txt | grep '/' | cut -d '.' -f 2,3,4,5 | sed 's#/##' | sed 's/ /\\ /g' | xargs rm

Output random characters.

> cat /dev/urandom | tr -cd [:alnum:] | dd bs=1 count=200 status=none && echo
