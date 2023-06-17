---
title: "Terminal Tips"
tags: [ "Documentation", "System" ]
---
## Track Live Changes

See changes in a file as it changes:

`tail -f *somefile*`

See changes in a directory, as it changes:

`watch -d ls *directory*`

## Automatic Renaming

There are a bunch of files:

* Column CV.aux
* Column CV.log
* Column CV.out
* Column CV.pdf
* Column CV.tex
* tccv.cls

Goal: swap the word "Column" for "Alice" in all files.

```
IFS=$'\n'
for f in $(find . -name "Col*"); do
mv "$f" $(echo "$f" | sed s/Column/Alice/)
done
```

IFS is the field separator.  This is required to denote the different files as marked by a new line, and not the spaces.

## Arguments and Input

The `rm' program takes arguments, but not `stdin' from a keyboard, and therefore programs cannot pipe results into rm.

That said, we can sometimes pipe into rm with `xargs rm' to turn the stdin into an argument.  For example, if we have a list of files called `list.txt' then we could use cat as so:

```bash
cat list.txt | xargs rm
```

... *However*, this wouldn't work if spaces were included, as rm would take everything literally.

## Numbers

Add number to variables with:

* `let "var=var+1"`
* `let "var+=1"`
* `let "var++"`
* `((++var))`
* `((var=var+1))`
* `((var+=1))`
* `var=$(expr $var + 1)`

`((n--))` works identically.

## Finding Duplicate Files

```bash
find . -type f -exec md5sum '{}' ';' | sort | uniq --all-repeated=separate -w 15 > all-files.txt
```

## Output random characters

```bash
cat /dev/urandom | tr -cd [:alnum:] | dd bs=1 count=200 status=none && echo
```
