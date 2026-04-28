---
title: CSV to Markdown in Vim
tags: 
- writing
- vim
- csv
- markdown
requires:
- writing/vim.md
---

Open a CSV table (I made this one with `:r!sed 's/:/,/g' /etc/passwd | head`).


```csv
root,x,0,0,,/root,/bin/bash
bin,x,1,1,,/,/usr/bin/nologin
daemon,x,2,2,,/,/usr/bin/nologin
mail,x,8,12,,/var/spool/mail,/usr/bin/nologin
ftp,x,14,11,,/srv/ftp,/usr/bin/nologin
http,x,33,33,,/srv/http,/usr/bin/nologin
nobody,x,65534,65534,Nobody,/,/usr/bin/nologin
dbus,x,81,81,System Message Bus,/,/usr/bin/nologin
systemd-coredump,x,981,981,systemd Core Dumper,/,/usr/bin/nologin
systemd-network,x,980,980,systemd Network Management,/,/usr/bin/nologin
```

Highlight the table.

- Go to the top, with 'root'.
- Type `V9j`.
- `:!column -ts, -o '|'`
- Return!


```csv
root            |x|0    |0    |                          |/root          |/bin/bash
bin             |x|1    |1    |                          |/              |/usr/bin/nologin
daemon          |x|2    |2    |                          |/              |/usr/bin/nologin
mail            |x|8    |12   |                          |/var/spool/mail|/usr/bin/nologin
ftp             |x|14   |11   |                          |/srv/ftp       |/usr/bin/nologin
http            |x|33   |33   |                          |/srv/http      |/usr/bin/nologin
nobody          |x|65534|65534|Nobody                    |/              |/usr/bin/nologin
dbus            |x|81   |81   |System Message Bus        |/              |/usr/bin/nologin
systemd-coredump|x|981  |981  |systemd Core Dumper       |/              |/usr/bin/nologin
systemd-network |x|980  |980  |systemd Network Management|/              |/usr/bin/nologin
```

The command displays as `:'<,'>!column -ts, -o '|'`.

This looks better, but the spacing is bad because the output separate is `-o '|'`.
You can put spaces around that pipe by making the separator a pipe (`-s'|'`)
and making the output separator a pipe with spaces (`-o' | '`).

```vim
:'<,'>!column -ts'|' -o ' | '
```


```csv
root             | x | 0     | 0     |                            | /root           | /bin/bash
bin              | x | 1     | 1     |                            | /               | /usr/bin/nologin
daemon           | x | 2     | 2     |                            | /               | /usr/bin/nologin
mail             | x | 8     | 12    |                            | /var/spool/mail | /usr/bin/nologin
ftp              | x | 14    | 11    |                            | /srv/ftp        | /usr/bin/nologin
http             | x | 33    | 33    |                            | /srv/http       | /usr/bin/nologin
nobody           | x | 65534 | 65534 | Nobody                     | /               | /usr/bin/nologin
dbus             | x | 81    | 81    | System Message Bus         | /               | /usr/bin/nologin
systemd-coredump | x | 981   | 981   | systemd Core Dumper        | /               | /usr/bin/nologin
systemd-network  | x | 980   | 980   | systemd Network Management | /               | /usr/bin/nologin
```

Make a header by copying the top line and replacing text (`yypkR`).

That's nicer, but the formatting's wrong again.

```markdown
User             | Passwords | UID   | GID   | Description                | Home            | Shell    
root             | x | 0     | 0     |                            | /root           | /bin/bash
[...]
```

Time to fix it with `:'<,'>!column -ts'|' -o'|'`.


```csv
User              |  Passwords  |  UID    |  GID    |  Description                 |  Home             |  Shell    
----------------- | ----------- | ------- | ------- | ---------------------------- | ----------------- | ----------
root              |  x          |  0      |  0      |                              |  /root            |  /bin/bash
bin               |  x          |  1      |  1      |                              |  /                |  /usr/bin/nologin
daemon            |  x          |  2      |  2      |                              |  /                |  /usr/bin/nologin
mail              |  x          |  8      |  12     |                              |  /var/spool/mail  |  /usr/bin/nologin
ftp               |  x          |  14     |  11     |                              |  /srv/ftp         |  /usr/bin/nologin
http              |  x          |  33     |  33     |                              |  /srv/http        |  /usr/bin/nologin
nobody            |  x          |  65534  |  65534  |  Nobody                      |  /                |  /usr/bin/nologin
dbus              |  x          |  81     |  81     |  System Message Bus          |  /                |  /usr/bin/nologin
systemd-coredump  |  x          |  981    |  981    |  systemd Core Dumper         |  /                |  /usr/bin/nologin
systemd-network   |  x          |  980    |  980    |  systemd Network Management  |  /                |  /usr/bin/nologin
```

Now we just need the spacer line.
Copy the top line (`yyp`) and replace (`:s/not-pipe/-/g`).
You can say 'not the pipe symbol' with `[^|]` or 'not-pipe-or-colon' with `[^:|]`.

```vim
:s/[^:|]/-/g
```

# Keyboard Shortcut

Put this in your `~/.vimrc` to map 'Control + s' to reformat CSV while in visual mode.


```vim
vmap <C-s> :!column -ts, -o " \| "<Enter>yyp:s/[^\|:]/-/g<Enter>
```
