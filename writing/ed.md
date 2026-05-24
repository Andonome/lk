---
title: "Ed: The Standard Editor"
tags: 
- writing
- guide
- sed
- vim
---

Understanding `ed` will let you understand all that feels strange about the system.
It set the standards for `sed` and `vi`.

`ed` was designed for real terminals, i.e. a typewriter.
You would type a command to the computer, and it would type out any errors.
It would not waste paper, ink, and time by typing out `COMMAND RUN SUCCESSFULLY` after each command.
A silent machine meant a happy machine.

To fully appreciate `ed`, you should [slow down your terminal][slow].

[slow]: shell/slow.md

# Basic Usage

Open a file:

```sh
ed file.md
```

Insert a new line.

1. Press `i<Return>`
1. Type the line.
1. Finish your edit with single dot.


```ed
i
dear diary,
.
```

Print the current line:

```ed
p
```

Change the current line:

```ed
c
Dear diary,
.
```

Delete the current line:


```ed
d
```

Write the 'buffer' to disk:

```ed
w
```

Quit:

```ed
q
```

# Working with Lines

Open that file:

```ed
ed file.md
```

Add a line:

```ed
a
Fortune of the day:
.
```

Run `fortune`, and place the results inside the current buffer:

```ed
r!fortune
?
```

The `?` indicates an error.  We can ask what the error was with the command
`h`:

```ed
r!fortune
?
h
Unexpected command suffix

```

The command `r` has something after it which makes no sense.  It should have a
space after the `r`!


```ed
r !fortune
42
```

That last line means `ed` has 42 characters in its buffer.

Read the current line, and show the line number:


```ed
n
2	How many weeks are there in a light year?
```

This means we are on line 2.

Fill up the file with fortunes:

```ed
r !for x in 1 2 3 ; do echo --- && fortune ; done
```

Print out which line in the file we are currently on:

```ed
=
12
```

There are twelve lines.  Go back up to line 3:

```ed
3
---
```

So line 3 just has our delimiter: `---`.

Whenever you hit enter, `ed` prints the current line then moves to the next
line.


```ed
I would have promised those terrorists a trip to Disneyland if it would have

gotten the hostages released.  I thank God they were satisfied with the

missiles and we didn't have to go to that extreme.
```

Go back a few lines:

```ed
-3
```

Print out 'current line', using the dot:


```ed
.
```

Print current line with the number of that line:


```ed
.n
11	Possessions increase to fill the space available for their storage.
```

Print and number the next three lines:


```ed
.,+3n
9	You have no real enemies.
10	------
11	Possessions increase to fill the space available for their storage.
```

Skip ahead four lines:

```ed
+4
?
h
Invalid address
```

This is an `invalid address` because there are no more lines, so `ed` cannot print them.

# All Commands

Meta Commands
-------------


| Aim                                             | Command         |
|:------------------------------------------------|:---------------:|
| Explain an error (`?`)                          | `h`             |
| Show a prompt when `ed` can take a command.     | `P`             |
| Change the default filename to `rec.txt`.       | `f rec.txt`     |
| Save the file.                                  | `w`             |
| Append a line after line 8.                     | `8a`            |
| Move three lines down.                          | `+3`            |
| Move four lines  back.                          | `-4`            |
| Move to the last line.                          | `$`             |

Create
------

| Aim                                                                 | Command         |
|:--------------------------------------------------------------------|:---------------:|
| Insert a line before line 5.                                        | `5i`            |
| Append a line after line 8.                                         | `8a`            |
| Read all of `~/.profile` into the current position.                 | `r ~/.profile`  |
| Run `dir` and place the results into the current position.          | `r !dir`        |
| Copy lines 10 to 15 to line 23.                                     | `10,15t23`      |


Read
------

| Aim                                                     | Command        |
|:--------------------------------------------------------|:--------------:|
| Print current line.                                     | `.` or `p`     |
| Read lines 1 to 10.                                     | `1,10p`        |
| Print and number lines 2 to 7.                          |  2,7n          |
| Find the next line ending with `fi`                     | /fi$/n         |
| Show the number of the next line starting with `if`.    | `/^if/=`       |
| Find the line which contains `HOME`.                    | `?HOME?`       |
| Print the next five lines literally (showing tabs).     | `.,+5l`        |
| Print from here till the end of the file.               | `.,$p`         |
| Show all lines with `HOME` and show their numbers.      | `g/HOME/n`     |


Update
------

| Aim                                             | Command                  |
|:------------------------------------------------|:------------------------:|
| On line 30, substitute `less` with `less -R`    | `30s/less/less -R/`      |
| Change each line starting `#` to `##`           | `,s^# /## /g`            |
| Move lines 50 to 55 to line 20.                 | `50,55m20`               |

Delete
------

| Aim                                             | Command     |
|:------------------------------------------------|:-----------:|
| Delete line 4.                                  | `4d`        |
| Delete from here to four lines down.            | `.,+4d      |
| Delete all lines starting with `#`.             | `g/^#/d`    |
