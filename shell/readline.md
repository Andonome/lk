---
title: Use the terminal in vi-mode
tags: 
- shell
- vi
- comfy
- readline
---

# Vi-Commands

Copy, move, and delete with vi-keys.

```sh
echo 'set editing-mode vi' >> ~/.inputrc
echo 'set keymap vi-insert' >> ~/.inputrc
exec bash
```

Try `ls <C-n>` and `ls <C-p>`

Use python in vi-mode

```sh
echo 'export PYTHON_BASIC_REPL=true' >> ~/.bashrc
exec bash
```

# Alias Expansion

```sh
echo '"\C- ": shell-expand-line' >> ~/.inputrc
exec bash
```

Now you can expand all aliases with 'Control + Space'.
Try just `ls`, then 'Control + Space'.

# Glob Expansion (`*`)

```sh
echo '"\C-x": glob-expand-word' >> ~/.inputrc
exec bash
ls *<C-x>
```

Are you sure you want to delete that?

```sh
rm -r *<C-x>`
```

Clean up the Downloads folder:

```sh
rm Downloads/*pdf<C-x>`
```

# Arbitrary Commands

Make a keyboard shortcut to type anything.
Use `\n` as a 'newline' character to automatically press `<Return>`.

```sh
echo 'Control-y: "| lolcat\n"' >> ~/.inputrc
exec bash
ls<C-y>
```

Clear the screen and have a fresh look with `C-l`.

```sh
Control-l: "\C-u clear -x && ls\n"
exec bash
cd /etc/<C-l>
```

# Fix Globs!

If you put the vi-commands in the wrong place in `.inputrc`, they stop working.
Put them at the start:

```sh
sed '/ vi/d' ~/.inputrc
sed -i '/ vi/d' ~/.inputrc

sed '1 i set editing-mode vi' .inputrc 
sed -i '1 i set editing-mode vi' ~/.inputrc 
sed -i '2 i set keymap vi-insert' ~/.inputrc 
```

# Vi-sibility

The `readline` prompt becomes confusing if you don't remember if you're in insert or normal mode.
But you can show the  current mode in the prompt:

```sh
echo 'set show-mode-in-prompt on' >> ~/.inputrc
exec bash
```

Set new symbols for normal and insert mode:

```sh
echo 'set vi-ins-mode-string "  "' >> ~/.inputrc
echo 'set vi-cmd-mode-string " "' >> ~/.inputrc
```

