# Quick Search for Files

You'll need to set up `locate` for this by installing `mlocate`.  `mlocate` needs a list of all files on the machine, so run:

> sudo updatedb

Then to find a file called 'my-cats.jpg', run:

> locate cats

# Whereis

`whereis angband`

... shows where the angband program is, along with configuration files, and binaries.

Also `which` shows where a binary file (the program) is, 

> which cmus

That's a lot of files for `cmus`, but you can find out exactly *which* is the program with:

> which cmus

`type` shows aliases:

> type cmus

