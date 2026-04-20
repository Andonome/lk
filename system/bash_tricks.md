---
title: bash tips
tags: 
- shell
- POSIX
---
## Track Live Changes

See changes in a file as it changes:

`tail -f *somefile*`

See changes in a directory, as it changes:

`watch -d ls *directory*`

Or use the `-g` flag to exit once the output changes.
This command will look at whether you're connected to the internet, and turn into a rainbow once the connection hits.

> watch -g ip address && clear && ip address | lolcat

## Automatic Renaming

There are a bunch of files:

* Column CV.aux
* Column CV.log
* Column CV.out
* Column CV.pdf
* Column CV.tex
* tccv.cls

Goal: swap the word "Column" for "Alice" in all files.

```sh
IFS=$'\n'
for f in $(find . -name "Col*"); do
mv "$f" $(echo "$f" | sed s/Column/Alice/)
done
```

IFS is the field separator.  This is required to denote the different files as marked by a new line, and not the spaces.

(Alternatively, just install `renameutils` and do `rename Column Alice *`)

## Arguments and Input

The `rm' program takes arguments, but not `stdin' from a keyboard, and therefore programs cannot pipe results into rm.
To fix this, use `xargs` to turn the stdin into an argument.
For example, if we have a list of files called `list.txt' then we could use cat as so:

```sh
cat list.txt | xargs rm
```

Of course if spaces are included in the file, you would have to account for that.

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

### POSIX WARNING

The number commands above work in `bash`, but not in bare-ass POSIX shells, such as `dash`.

Instead, you might do:

```sh
x=2
x=$(( x +1 ))
x=$(( x*x ))
```

## Finding Duplicate Files

```sh
find . -type f -exec md5sum '{}' ';' | sort | uniq --all-repeated=separate -w 15 > all-files.txt
```

## Output random characters

```sh
cat /dev/urandom | tr -cd [:alnum:] | dd bs=1 count=200 status=none && echo
```

## Temporary Working Directory

Try something out in a random directory in `/tmp` so the files will be deleted when you next shut down.

```sh
mktemp -d
```

That gives you a random directory to mess about in.

```sh
   dir=$(mktemp -d)
   for x in {A..Z}; do
      fortune > "$dir"/chimpan-$x
   done
   cd $dir
```

### POSIX WARNING

These smart-brackets are a bash feature.
If you try to use `{A..Z}` in dash, it will think of this as a single item.

