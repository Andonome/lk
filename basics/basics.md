---
title: "Basics"
tags: [ "basics" ]
---

You need about a dozen commands to move around Linux.
After that, you look up the rest as you go.
Don't worry about understanding any of it, just type it in and the habit forms pretty quickly.

You start in a dark room. You want to know where you are by **p**rinting out your **w**orking '**d**irectory' (i.e. 'location'):

```sh
pwd
```

Have a look at what is here:

```sh
ls
```

If you get no response, the list of items is "", meaning "nothing here".

Have a look at **a**ll the files:

```sh
ls -a
```

```sh
. ..
```

So `.` means 'here' and `..` means 'you see stairs leading downwards' (e.g. 'the directory behind you').

Change directory (`cd`) down one level:

```sh
cd ..
```

Look where you are again with `pwd`, then go back up.  Use `ls`, and if you see `bob`, then:

```sh
cd bob
```

Move around the directories.  The place at the bottom is the 'root', and is known as `/`.  Go to the root:

```sh
cd /
```

Do `ls` again and `cd` into `etc`.  Look at how much space those folders are taking up:

```sh
du iptables
```
That's the number of kilobytes the file is taking up.
Do the same again, but in a human-readable format:

```sh
du -h iptables
```

The `du` program has `-h` for 'human', '-s' for 'short', and a bunch of other commands.
Have a look at the manual and try another command:

```sh
man du
```

Once you're done, press 'q' to quit the manual page and try the extra `du` flag you've found.

Now you can try to gain super-powers and take over the system:

```sh
sudo -i
```

At this point, you are 'root'.
All your commands will be executed, even if they're unsafe, or even if you ask to delete the entire machine.
Best to exit out of the root account:

```sh
exit
```

Go find a file that isn't a directory.  You can tell which is which with:

```sh
ls -l
```

A directory starts with a 'd', like this:

```sh
drwxr-xr-x 79 root root 4096 Jan  3 05:15 /etc/
```

A standard file starts with '-', like this:

```sh
`-rw-r--r-- 1 root root 8 Dec 11 17:26 hostname`
```

Look inside the file /etc/hostname to find out your computer's name:

```sh
cat /etc/hostname
```

Print out the words "hello world":

```sh
echo "hello world"
```

Move back to your home directory:

```sh
cd
```

Take the words 'hello world', and put them in 'my_file':

```sh
echo 'hello world' > my_file
```

Measure the disk usage of that file, then put the results at the bottom of the file:

```sh
du $FILE >> $FILE
```

And check the results:

```sh
cat $FILE
```

# Autocompletion

Press tab after typing a few keys and bash will guess what you're trying to  type.

# Permissions

Look at your file's owner:

```sh
ls -l $FILE
```

If it says `-rw-r--r-- 1 root root 8 Dec 11 17:26 hostname` then the file is owned by 'root'.

Take your file and change the owner to root:

```sh
sudo chown root $FILE
```

Change the same file so it's owned by the group 'audio':

```sh
sudo chown :audio $FILE
```

Check you did that correctly:

```sh
ls -l my_file
```

> -rw-r--r-- 1 root audio 0 Jan  3 19:20 my_file

Read the start of that line.  Root can 'read' and 'write' to or delete the file.  Try to remove (delete) it:

```sh
rm $FILE
```

You'll see you're not allowed, because you don't own it.

Look at which groups you're in:

```sh
groups
```

Change the file so that members of the audio group can write to the file:

```sh
sudo chmod g+w $FILE
```

Check you got it right with `ls -l`:

```sh
-rw-rw-r-- 1 root audio 0 Jan  3 19:20 my_file
```

Try to delete the file again:

```sh
rm my_file
```

If you can't, you're not in the audio group.  Add yourself.  You'll need to *modify* your *user account*, by **a**ppending 'audio' to your list of groups.
Use `-a` to **a**ppend, and `-G`, to say you're modifying groups:

```sh
sudo usermod -a -G audio [ your username here ]
```

Now you should be able to remove (delete) the file.  Remember, that using 'rm file' will not send it to a recycling bin. The file is gone.

# Directories

Make a directory called 'new test':

```sh
mkdir 'new test'
```

Make two directories, called 'A', and 'Z':

```sh
mkdir A Z
```

Make a single directory called 'A Z'

```sh
mkdir 'A Z'
```

# Text Searches

Measure the disk usage of everything ('\*' means 'everything'), and put it in a file called 'disk usage.txt':

```sh
du -sch * > A/'disk usage'.txt
```

Look at your file:

```sh
cat A/'disk usage.txt'
```

If you think you have too much information, use `grep` to just get the one line of text you want:

```sh
grep total A/disk\ usage.txt
```

The `grep` program also has a manual ('man page').  You should find out what that `-c` flag does, but the manual is too long to read.

Start the manual:

```sh
man du
```

Then search for `-c` by pressing `/`.  Your final keys should be `man du`, then `/-c`

Find out if the `ls` program also has a 'human readable' format by using `grep` to search for the word 'human':

```sh
man ls | grep human
```

Now use that flag that you've found in combinatin with the `-l` flag to look at a file.

Remove the directory 'Z':

```sh
rmdir Z
```

Remove the directory 'Z':

```sh
rmdir Z
```

And then remove all the rest:

```sh
rmdir *
```

The 'A' directory will not budge because it's not empty.  Remove it recursively, so the computer will remove the things inside the directory as well as the directory itself:

```sh
rm -r A
```

# Installation

You get a package manager which installs programs, fonts, et c.
If you're on something like Debian, you'll have `apt`, or if you're on something like Red Hat, you'll have `yum`.
If unsure, ask where a program is:

```sh
whereis yum
```

```sh
whereis apt
```

If you get a hit, you can use whatever program that is to install things.

Set a reminder of your package manager:

```sh
echo my package manager is yum | lolcat
```

If that failed it's because you don't have `lolcat` installed.
Install lolcat:

```sh
sudo apt install lolcat
```

Try the same command again.

Search for things you want, like `libreoffice`, or `gimp`:

```sh
apt search libreoffice
```

... then install one of them with:

```sh
apt install $PROGRAM
```

Remove `lolcat`, because it's useless:

```sh
sudo apt remove lolcat
```

...and that's pretty much it.
You can move, create, destroy, install things, and look things up.

# Review

- Search for random things with your package manager and install the interesting ones.
  * Read the manual with `man thing`
  * If it's useless, remember to uninstall it.
- Have a look around the file system in `/`.
- Look in the `.config` folder in your home directory.
  * If you copy a program's config to another machine, the program will behave just like you set it up in your own machine.

