---
title: Python Projects with Makefiles
tags: 
- setup
- system
- makefiles
- graphviz
- python
requires: 
- system/makefiles.md
---

If you have a python script which requires a packages - e.g. `graphviz` - you can automate the setup with a `Makefile`.
The `Makefile` will:

1. Make three copies of an 8-line installer script.
2. Use one of the installer script to install local packages.
3. Install a symbolic link to python.
3. Make a script called `activate`, which tells python to use 

# Context

Python coders don't like updating their projects, they just expect everyone to install the same version of everything that they have.
Historically, people dealt with this by installing only half a dozen copies of `graphviz`; but now each python project uses a local environment, with a local copy of `graphviz`, which means everyone gets to install a new copy of `graphviz` every time they try out a project.

Downloading 40MB of software for each 40-line script you write is called 'virtual environments' because it sounds cool.
We can make it even cooler with `make`, but not yet, because python - like the fae of old - will not fetch anything until you know its true name.

# Setup

```sh
command -v python
realpath `!!`
```

You must reveal that true path, because `python` is always a relative symbolic link, to an absolute symbolic link, which leads to a shortcut.
We can finally let `make` know how to invoke python, and where it will install `graphviz`.

If your python's version is '3.14', then python needs its packages placed in `${somewhere}/lib/python3.14/site-packages/`.
You must create a new, local, name for these packages, because - like the fey of old - python demands a private name in return for revealing its true name.

I'll call mine `camelot`, because the path is long and arduous.
Set up the Makefiles like this:

```make
py_link != command -v python
py != realpath $(py_link)
version != basename $(py)

virtenv = camelot
```

Now you can ask for a local `pip` script, which can install the python packages:

```make
    [...]

$(virtenv)/bin/pip:
    $(py) -m venv $(virtenv)
```

Finally, list the packages you want in `requirements.txt`, and make `pip` install from it.


```sh
ppkg=graphviz
echo ${ppkg} > requirements.txt
```

```make
    [...]

pkgs = $(virtenv)/lib/$(version)/site-packages/

$(pkgs): $(virtenv)/bin/pip
$(pkgs): requirements.txt
    $(virtenv)/bin/pip install -r $<
```

The complete Makefile looks like this:


```make
all: .default

py_link != command -v python
py != realpath $(py_link)
version != basename $(py)

virtenv = camelot

$(virtenv)/bin/pip:
    $(py) -m venv $(virtenv)

pkgs = $(virtenv)/lib/$(version)/site-packages/

$(pkgs): $(virtenv)/bin/pip
$(pkgs): requirements.txt
    $(virtenv)/bin/pip install -r $<

.PHONY: .default
.default: $(pkgs)
```

