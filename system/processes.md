---
title: "processes"
tags: [ "basics" ]
---
# Proccesses

See running items in current terminal with 

```sh
ps
```

or more with 

```sh
ps -a
```

Or the entire system with

```sh
ps -e
```

Or the entire system with more information, BSD style, with:

```sh
ps aux
```

And then search for a particular program with 

```sh
ps aux | grep cmus
```

# Jobs

Pause a job with ^z.  Put it in the background with the '&' suffix.

List jobs in the current shell with

```sh
jobs
```

And then you can pull number 1 up again with 

```sh
fg 1
```

Or continue running a stopped job with:

```sh
bg 1
```

# Nice

This changes how nice a program is, from -20 to 19.

Install a program, but nicely, at nice value '10':

```sh
nice -10 sudo apt -y install libreoffice
```

Aggressively use Steam, with a nice value of '-13'.

```sh
nice --13 steam&
```

Find out that Steam's fucking everything up, so you change its nice value with 'renice':

```sh
renice --5 -p 3781
```

Nerf all of roach-1's processes:

```sh
renice 10 -u roach-1
```

... or the entire group

```sh
renice -14 -g hackers
```

