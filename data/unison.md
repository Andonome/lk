---
title: unison
tags: 
- backups
- synch
requires: 
- networking/ssh.md
---

Install unison on both machines, and make sure both have the same version of unison, with the same version of the ocaml compiler (the smallest difference will cause problems).

```sh
unison -version
```

Create the `~/.unison` directory on both machines.

Make a job called `backup`:

```sh
job=backup
```

Here is an example job, which synchronizes the `~/music` directory with a remote machine which has the same username.


```sh
echo "
auto = true
root=$HOME
root=ssh://${user}@${ip_address}/$HOME

path=music

ignore=Name *.flac
" > ~/.unison/"${job}".prf

```

Remember to specify `${ip_address}`

The last command means it will ignore any file with a name ending in `.flac`.

## Automatic Runs

The first command means this will run but also confirm which files will be deleted, and which will be transferred, us `batch = true` instead.
Or you can deleted that line in the `.prf` file and run it with a flag:

```sh
unison -batch ${job}.prf
```

Set unison to run with crontab or a systemd unit file to have directories synchronize automatically.

## Problem Solving

You will see data files summarizing what has happened in the `~/.unison` directory.
If something goes wrong, you may be prompted to delete these to start again.

