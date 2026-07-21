# Linux Knowledge Base

## Setup

- Install `make`, `recutils`, and any a fuzzy-finder (like `fzf` or `sk`).
To find the options, run `make`.
- Run `make`.

## Finding Notes

Run `make query` to find a note.

You can also run `make function` and LK spits out a `bash` function for your
`~/.bashrc` so you can run queries from anywhere.

```bash
make function
make function >> ~/.bashrc
exec bash
lk
```

The notes assume readers will type the commands to see the output, so most
notes do not show the expected output.

## Writing Notes

To note down a single command, add the command to `command.rec`.
For longer articles, run `make article`.

# Writing Style

## State Knowledge Dependencies Up-Front

Articles should never link to other resources after at the start.
If the article assumes an understanding of GPG keys, then it should say that at the top.
People should be able to read documentation from the beginning, then keep going until the end, and then stop.
Setup guides should not send the reader on a detour through labyrinths of links.

## No History, No Context

Anyone who wants to read how to use OTP with GPG already knows what those words mean, so guides should not spend time explaining.
Anyone who doesn't know what GPG keys are can learn faster by using them than by reading metaphors about doors to represent tricks with prime numbers.

## Index by Purpose

Nobody wants to read about `grep`, they want to find words, like 'cat'.
They want to 'download a website', not learn about `wget`.
Guides should be created and indexed by purpose, not by binary.

## Be Opinionated

- Guides should not ask the reader to pick from a list of options.
- Options for different file-systems, databases, et c., should be written as separate guides.

## Repetition Beats Reference

If a database requires three commands to set up, it's better to repeat those three commands for every program that requires a database than to just link to another file which discusses databases.

## Show Options as Variables

Look at this line:

```sh
grep ls --color=always  $HISTFILE | less -R
```

What else can go in place of `always`?
Can you say `--color=red`?
Can you put anything?
The answer is not obvious.

What about this line:

```sh
git branch new
git checkout new
```

Do you always use `new`?
Can you use another word here?
The answer is not obvious.

It's better to make all arbitrary values variables.

```sh
name=new
git branch ${name}
git checkout ${name}
PAGER='less -R'
grep ls --color=always $HISTFILE | $PAGER
```

Now we can see what can be changed.

### Aim to Script

Guides should read like a heavily commented script, so CLI commands are preferred to GUI commands.

- Bad: '*edit the file `.config/tspreed/tspreed.rc` and change `focuscolor` to '2'.*'
- Good: `sed -i '/focuscolor/s/=1/=2/' ~/.config/tspreed/tspreed.rc`
    * `cat !$`

Interactive bash commands like `cat !$` work fine, even if they don't work in scripts.

### Show, Don't Tell

Articles should say what to type, not the output.
If the command is `ls`, users will see files once they try the command, but the article does not need to provide an example list of files unless an important point has to be made about output.

Once a user enters a new group, the change doesn't take effect until you log
in.  This could be explained at length, or the reader can see what this means
for themselves:


```sh
groups
grep audio /etc/group

sudo usermod -aG audio $USER
groups
grep audio /etc/group

su $USER
groups
grep audio /etc/group
```

Troubleshooting steps can often be implied by adding commands which do nothing but check the results of previous commands.

# What's Wrong with Everything Else?

Why bother writing yet another cheat-sheet collection?

## Man pages

- Orders items by the alphabet rather than by relevance.
- Often presumes you know everything except that one program.
- Often written in the 80's, and it shows.
- Zero respect for your time.
- Sometimes reference `info` pages (yuck).

## `curl cheat.sh`

- Doesn't have the programs I like.
- Too short to get you started on many programs.
- Poor understanding of priority (`git stash` is covered before `git commit`).
- Repetitive
- Keeps going offline.

# Current State

LK has been working well for some years, but needs more outside eyes.

