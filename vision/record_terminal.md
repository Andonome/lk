---
title: Record a Terminal Session
tags: 
- vision
- share
---

Record a terminal command, then press 'Control + d' to exit.

```sh
script --timing=time.log stat.txt
ls -a
ls -al
stat ~/.bashrc
^D
```

Replay the session:

```sh
scriptreplay --timing=time.log stat.txt
```

Try a bare command, without any timing:

```sh
script -c 'top | lolcat' loltop
nl loltop
```

Has your terminal messed up?
Is the cursor hiding?
Reset it!

```sh
reset
```
If you can't see any keys, keep typing anyway: have faith in your terminal.

This `loltop` file will not play properly as it has no timings file.
But you can cheat the system and use your other timings file:

```sh
scriptreplay --timing=time.log loltop
```

This will mostly not work well, but it shows how the timing file works:


```text
0.033401 23
0.044513 8
0.000016 219
1.349324 114
0.179106 1
0.088790 1
0.072821 1
0.358337 2
0.000254 9
0.004720 52
0.000084 21
0.155462 671
```

I think it works like this?

| How long it took | to type *n* characters |
|:----------------:|:----------------------:|
| 0.033401         | 23                     |
| 0.044513         | 8                      |
| 0.000016         | 219                    |
| 1.349324         | 114                    |

