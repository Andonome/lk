---
title: Give shell script options
tags: 
- shell
- script
requires: shell/scripts.md
---

Place this in a file called `options.sh`, and make it executable.

```sh
#!/bin/sh

echo "This script is called $0"

while getopts oe: choice ; do
    case "$choice" in
        o)
        echo "This is option number '${OPTIND}'."
        ;;
        e) echo "Option number '${OPTIND}' uses this variable: '${OPTARG}'."
        ;;
        \?) echo "That's not an option."
        exit 1
        ;;
    esac
done
shift "$(($OPTIND -1))"

echo "The standard arguments are: $@"
```

Try the options:


```sh
./options.sh -o
./options.sh -e elephant
./options.sh Some random words
./options.sh -efox Some other words
```

Try the script again, without the `shift` statement.

**NB:** You can change `choice` to any variable, but you must use `OPTARG` to show an option's argument and `OPTIND` to show the index of that argument.
