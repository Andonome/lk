---
title: Easy Number Checks
tags: 
- shell
- comfy
---

Number checks are too long.

```sh
if [ "$x" -gt "$y" ]; then
    echo "$x"
else
    echo "$y"
fi

```

Write a shorter number check like this:

`echo $(( x > y ? x : y ))`

Longer checks are possible:

```sh
col(){
    n=$(( $1 % 2 == 0  ? $1 /2 : $1 * 3 + 1 ))
    echo $n
    [ $n -eq 1 ] || col $n
}

col 4
col 5
col 9
col 27
```

