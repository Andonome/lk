# Processes

Process id 1 is systemd.  All other processes are child processes.

> ps -sH

This has every process on the system, and -H shows the hierarchy.  This can be piped to less to view easily.

> ps -u ghost

Looking at processes spawned from user 'ghost'.

> ps -e --forest

Like tree, but more.

> ps -sfH

The fucking lot.

All of this is from /proc, which is a direct line to the kernel.  Commands like `free', `top' et c. pulls from /proc.

# Top

In `top' we can take the pid and then press `k' in order to kill that process.

# check what's going on with qutebrowser

> ps aux | grep qutebrowser

# Check open ports
sudo netstat -tulpn

#Check that udev process
systemctl status udev

# Show net interface
> ip addr show

This can also take arguments, such as the name of an interface.

# Find

> find . -name 'bob cv'

Find file 'bob cv'

> find . -size +7G

Find files of 7Gig or more.

> find -name *hidden* -type l

Find a symbolic link containing 'hidden' in the name.

> find -name *txt -delete

Delete all files from here of the *txt type.

> find -type d -empty

Find empty directories.

> find . mtime 50

Find all file modified precisely 50 days ago.  There's also:

* -mtime +20
   * file modified more than 20 days ago.
* -atime -13
   * file *accessed* less than 13 days ago.
* -cmin 20
   * file *modified* 20 minutes ago.
* -mmin +70
   * files modified more than 70 minutes ago.


# Logs

> cat /var/logs/auth.log | grep fail


# Files

> file example.txt

This shows info about a file.

# Further reading

[Hund](https://hund0b1.gitlab.io/2019/02/11/a-collection-of-handy-ways-of-manipulating-text-in-bash.html) has some fantastic examples.


