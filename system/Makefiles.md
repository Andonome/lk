---
title: "Makefiles"
tags: [ "system", "makefiles" ]
---

The `make` system wants to know:

1. What file you want to make,
1. Which other files it depends on, and
1. How to build the file.

Start with a basic test-area.

```bash
mkdir make_test ; cd $_
printf "%s:\n" README.md > Makefile
printf "\t%s\n" 'echo "Basic makefile example." > $@' >> Makefile
make
```

**NB:** Always tell `make` how to build files with a `\t` (tab) character.
Using four spaces will not work!

## Dependency Files

Now we've made a `README.md` file, we can show how a makefile looks in the README:

```make
README.md: Makefile
	echo "Basic makefile example." > $@
	echo "" >> $@
	echo '```' >> $@
	cat $< >> $@
	echo '```' >> $@


```

Note the order:

1. The first thing is the file you want, then a colon (`:`).
1. After the colon, any file it depends on.
1. Finally, the shell commands to execute.

# Strange Sigils

Notice that the file above can print into the README by using `echo "" >> $@`.
The `$@` stands for 'the file which we want', and `$<` stands for 'the first dependency file'.
The `make` program starts by replacing those variables, and the result it:

```make
README.md: Makefile
	echo "Basic makefile example." > README.md
	echo "" >> README.md
	echo '```' >> README.md
	cat Makefile >> README.md
	echo '```' >> README.md


```

|  Sigil  | Meaning                                |
|:-------:|:--------------------------------------:|
| `$@`    | The file we want                       |
| `$<`    | First dependency file                  |
| `$^`    | All dependency files                   |
| `$(@F)` | Filename of the file we want           |
| `$(@D)` | Directory path of the file we want     |
| `$(<F)` | Filename of the first dependency       |
| `$(@D)` | Directory path of the first dependency |

## Basic Variables

You can assign a variable normally, but must refer to it in brackets.


```make
storage_directory = backups

README.md: Makefile
	echo "Basic makefile example." > $@
	echo "" >> $@
	echo '```' >> $@
	cat $< >> $@
	echo '```' >> $@

$(storage_directory)/README.md: README.md
    mkdir $(@D)
    cp $< $@

```

Now you can tell `make` to create the backup:

```bash
make backups/README.md
```

## Command Variables

The backup `README.md` could be named after the current minute of the day, using `date +%M`.
This allows up-to-the-minute backups:

```make
current_minute != date +%M

storage_directory = backups

README.md: Makefile
	echo "Basic makefile example." > $@
	echo "" >> $@
	echo '```' >> $@
	cat $< >> $@
	echo '```' >> $@

$(storage_directory)/backup_$(current_minute).md: README.md
	mkdir $(@D)
	cp $< $@

```

...but the repeated use of `mkdir` is causing an error, because that directory already exists.

We can solve this by using `mkdir -p`.

## Phony Targets

But we don't want to look up the current minute of the day to make backups.
Better to just say `make backup`.
However, this will confuse `make`, because `make` thinks everything is a file, so it would try to make a file called `backup`.

The solution is to tell `make` that `backup` is a phony target.

```make
  [ ... ]

.PHONY: backup
backup: $(storage_directory)/backup_$(current_minute).md
$(storage_directory)/backup_$(current_minute).md: README.md
	mkdir -p $(@D)
	cp $< $@

```

Now run `make backup` to create an up-to-date backup.

# Order

Makefile thinks like this:

1. Fill in all the variables in the file, from top to bottom.
1. If variables are missing, go through the file again.
1. Figure out the order the files should be built in.

In this case, the makefile can see that `backup` depends on the current backup file (with the minute in the filename), which depends on the `README.md` file, which depends on the Makefile itself.

```graph

┌──────────────────────┐
│       Makefile       │
└──────────────────────┘
  │
  │
  ▼
┌──────────────────────┐
│      README.md       │
└──────────────────────┘
  │
  │
  ▼
┌──────────────────────┐
│ backups/backup_06.md │
└──────────────────────┘
  │
  │
  ▼
┌──────────────────────┐
│        backup        │
└──────────────────────┘
```

# The Rest

- [File patterns](Makefiles/patterns.md)
- [Makefile graphs](Makefiles/graph-easy.md)
