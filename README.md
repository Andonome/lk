# Linux Knowledge Base

These notes Linux programs have grown into a searchable knowledge base.

# Usage

## Setup

Install `make`, `recutils`, and any a fuzzy-finder (like `fzf` or `sk`).

To find the options, run `make`.

## Queries

The fuzzy finder opens an interactive menu to find information.

There are two types of notes:

1. Short commands, catalogued by aim (in `command.rec`).
1. Short notes, mostly on getting set up with something (in the markdown files).

### Short Commands

Running `make check` will start a search of the snippets, ordered by what you
want to do, not by the name of the binary:

```
    Hard reset ntp service
 -> Quickly find and open run-command files
    Turn markdown into a man page
    Rotate a video
    Translate a media file to a new type
```

The output is a couple of lines of code, with changeable components as variables:

```
alias rrc='$PAGER "$(find . -maxdepth 2 -name "*rc" | fzf)"'
```

### The Function

Running `make function` outputs a shell function which searches through this
knowledge base, so you don't have to `cd` to use it.


```sh
lk(){
	/usr/bin/mdless "$(recsel ${your-path-here}/lk/db.rec \
    -q "$(recsel ${your-path-here}/lk/db.rec -CP title,tag \
    | sort -u \
    | /usr/bin/fzf )" -CP path \
    | fzf --sync -1 --preview='less -iR {}' )"
}
```

Add the function to your bash shell like this:

```bash
make function
make function >> ~/.bashrc
exec bash
lk
```

# Style

## State Knowledge Dependencies

Articles should never link to other resources part-way through.
If the article assumes an understanding of GPG keys, then it should say that at the top.
People should be able to read documentation from the beginning, then keep going until the end, and then stop.
Setup guides should not send the reader on a detour through labyrinths of links.

## No History, No Context

Anyone who wants to read how to use OTP with GPG already knows what those words mean, so guides should not spend time explaining.
Anyone who doesn't know what GPG keys are can find the link to using them, which explains them better than using door-blocking devices as a metaphor for prime number factorization.

## Index by Purpose

Nobody wants to read about `grep`, they want to find words, like 'cat'.
They want to 'download a website', not learn about `wget`.
Guides should be created and indexed by purpose, not by binary.

## Be Opinionated

- Guides should not ask the reader to pick from a list of options.
- Options for different filesystems, databases, et c., should be written as separate guides.

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

Despite being 'script-like', interactive bash commands like `cat !$` are still fine just to show how to double-check results when setting things up interactively.

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

# Current State

It's a bit of a mess.
If you like the format, send me a pull request.

