# STIN, STOUT, STERR

Input is 0, output is 1, error is 2.

Pipe standard output to log.txt while also outputting it.

> cat file.txt |& tee -a log.txt

Copy file and *if* that's successful, delete it where it stands.

> scp archive.tar.gz pi@192.168.0.31:/home/pi && rm archive.tar.gz

A double pipe will try one, and do the other if that fails.

> cp -r ~/Archive ~/Backup || tar czf Archive.tar.gz *

# REGEX

Regular expression characters include:

\\ ^ $ . | ? * + () [] {}

As a result, grep cannot read these characters as literal characters unless they are escaped.  E.g.

> grep wtf\? log.txt

... will search the string 'wtf?' in the file log.txt.  Another version is egrep (now used with 'grep -e') which uses more characters as special characters, or fgrep, which treats all characters as literal strings.

# Environmental Variables

PWD, USER, PATH

To display all environmental (but not local) variables, use

> env

Set a variable with

> colour=red

Display your variable with

> echo $colour

Export this to the entire system using:

> export colour=blue

# Search commands

> apropos cat

# Working with Text

Convert every tab to ten spaces.

> expand -t 10 file.txt

Or the reverse, with 3 spaces converting to a tab.

> unexpand -t 3 file.txt

Format a file by cutting text after 60 characters.

> fmt -w 60 file.txt

Indent all but the first line of a paragraph.

> fmt -t file.txt

Look at the new lines of a file only:

> tail -f /var/log/syslog

The sort function arranges lines alphabetically.  Use -r to reverse and -n to sort by number.

# Sed

> sed -i s/hey/hoi/g greetings.txt

Edit all examples of hey to hoi in greetings and print that to the file.

# Measurement

Measure how long a script takes for super-autism powers.

> time [bash script]

# Functions

> function my_funct(){ do_thing $1; }

Remove a function with

> unset my_function

# Paths
Every shell has various paths from where it can execute binary files.  Find out your current one with:

> echo $PATH

To add a directory to a path, e.g. /usr/share/bin, you can declare it in addition to the old path with:

> PATH=$PATH:/usr/share/bin

And then check it by echoing the path again.

Before this, probably best to check the path exists with:

> if [ -e /usr/share/bin ]; then

> 	echo yes

> fi
 
# Pipes, Pedantry and Brackets

Things that [[ ]] statements can do which [ ] statements cannot:

- Intuitive and easy 'and' statements.
	- [[ -z $var && -d ~/LK ]]
- Intuitive and easy 'or' statements.
	- [[ -d LK || -f ghost-backup.zip ]]
- Simple expression comparisons
	- [[ $v1 > $v2 ]]
- Simple expression comparisons with clumsy strings
	- [[ item-1 > item-2 ]]
- Vague comparisons
	- [[ $answer =~ ^y(es)?$ ]]

# exec

exec will start a process running as just that process.  In a bash script, the line:

> unison rat

... will startup `unison` as a sub-process of bash. But:

> exec unison rat

... starts unison as its own process.

# Brace expansion

> mv picture{,-1}.jpg

This expands to 

> mv picture.jpg picture-1.jpg

# `for` Statements

for f in *tiff;do
	convert "$f" "${f/.tiff/.png}"
done
