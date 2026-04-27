---
title: Bash tips
tags: 
- shell
- comfy
- bash
---

# This & That

Refer to 'that last thing', and 'the first thing':

```sh
fortune -l > file1
cat !$  | tr -d u > file2
cat file1 !$
diff !^ !$
```

**NB:** this can go wrong:

```sh
ls -l file1 file2
cat !^
```

**NB:** this only works when running `bash` interactively, never in scripts.

# Lists

You can put a list inside any `bash` argument, and `bash` will expand that part into a new argument.

```bash
echo file {one,two,three}.txt
echo file-{one,two,three}.txt
touch !$
```

Look at text files:

```bash
ls *.{txt,md}
```

Look at size of jpg or png files in the `img/` directory:


```bash
du img/*.{jpg,png}
```

# Automatic Lists

```bash
echo {a..d}
echo Archive_{B..E}
```

Using multiple lists works fine.

```bash
mkdir first second third
echo {first,second,third}/file_{1..3}.txt
x={first,second,third}/file_{1..3}.txt
echo $x
echo {first,second,third}/file_{1..3}.txt
x="$(!!)"
echo $x
for file in $x ; do fortune > $file ; done
```
