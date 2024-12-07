---
title: "Quality of Life"
tags: [ "basics", "setup" ]
dependencies: [ "vi", "basics" ]
---

This & That
===========

Refer to 'that last thing', and 'the first thing':

```bash
fortune -l > file1
cat !$  | tr -d u
diff !^ !$
```

**NB:** this can go wrong:

```bash
ls -l file1 file2
cat !^
```

Done
----

`<C-d>`

- If you have a command, Control + d will execute the command.
- If you have nothing, `exit`.

Input Run-Commands (`~/.inputrc`)
=================================

Alias Expansion
---------------

```bash
echo '"\C- ": shell-expand-line' >> ~/.inputrc
exec bash
```

Now you can expand all aliases with 'Control + Space'.
Try just `ls`, then 'Control + Space'.

Glob Expansion (`*`)
--------------------

```bash
echo '"\C-x": glob-expand-word' >> ~/.inputrc
exec bash
ls *<C-x>
```

- Are you sure you want to delete that?
    * `rm -r *<C-x>`
- Clean up the Downloads folder:
    * `rm Downloads/*pdf<C-x>`

Arbitrary Commands
------------------

Use `\n` as a 'newline' character to automatically press `<Return>`.

```bash
echo 'Control-y: "| lolcat\n"' >> ~/.inputrc
exec bash
ls<C-y>
```

```bash
Control-l: "\C-u clear -x && ls\n"
exec bash
cd /etc/<C-l>
```

Readline as Vi
--------------

```bash
echo 'set editing-mode vi' >> ~/.inputrc
echo 'set keymap vi-insert' >> ~/.inputrc
exec bash
```

The prompt now works according to `vi`-motions.
This goes much further than the bash-option, `set -o vi` ('set option: `vi`').
It changes the cursor in the terminal, not just bash.

Try:

- `ls <C-n>`
- `ls <C-p>`
- Type some words.
- `<Esc>0dw$p`
- <Esc> to normal-mode, and go back with 'b', and forward with 'e'.
- `4b` to step back four times.
- `cE`
- `<Esc>kcw`
- ls -a<Esc>xxxx

Works with `python` too:

```python
im<C-n>os<Return>
os.li<C-n><Return>
<Esc>kfn
<C-d>
```

Fix Globs!
----------

If you tried the previous commands then they will not work any more, because the `vi`-commands overwrite the other commands.
Remove them.

```bash
sed '/ vi/d' ~/.inputrc
sed -i '/ vi/d' ~/.inputrc

sed '1 i set editing-mode vi' .inputrc 
sed -i '1 i set editing-mode vi' ~/.inputrc 
sed -i '2 i set keymap vi-insert' ~/.inputrc 
```

Vi-sibility
-----------

The `readline` prompt becomes confusing if you don't remember if you're in insert or normal mode.
But you can show the  current mode in the prompt:

```bash
echo 'set show-mode-in-prompt on' >> ~/.inputrc
exec bash
```

Set new symbols for normal and insert mode:

```bash
echo 'set vi-ins-mode-string "  "' >> ~/.inputrc
echo 'set vi-cmd-mode-string " "' >> ~/.inputrc
```

Fuzzy Sort
==========

Check your repos for `sk-im`, and install.
The program is called `sk`.

```bash
FUZZY=sk
```

If you don't have it, `fzy` or `fzf` should work the same way.

```bash
FUZZY=fzy
```

Find some 'read-config' files to check out:

```bash
find . -maxdepth 2 -name "*rc"
find . -maxdepth 2 -name "*rc" | $FUZZY
```

And read some:

```bash
PAGER='less -R'
$PAGER "$(find . -maxdepth 2 -name "*rc" | $FUZZY)"
```

Make the change long-term:

```bash
alias rrc='$PAGER "$(find . -maxdepth 2 -name "*rc" | sk)"'
alias | grep rrc= >> ~/.bash_aliases
```
