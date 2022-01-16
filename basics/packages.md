---
title: "packages"
tags: [ "Documentation", "basics" ]
---
# Looking

Your package has something to do with unzipping.  Find out more:

> apropos unzip

# Maintenance

> dpkg -l

List what's installed.

# Libraries

Libraries under /lib/ typically contain an .so suffix when they're dynamic.  It means 'shared object' as a number of programs will refer to it.

Others will have an /a/ suffix, meaning that they're static, and will be loaded at runtime.

We can check the dependencies of a program using the ldd command upon anything in a library. For example:

> ldd/usr/bin/md5sum

... shows us that md5sum depends upon:

- linux-vdso.so.1

- libc.so.6

- lib64/ld-linux-x86-64.so.2

To list all libraries, run:

> ldconfig -p

For example, if looking at /usr/lib/x86_64-linux-gnu/libXcomposite.so.1, we might wonder what it's for.  We can then run:

> ldconfig -p | grep libXcomposite

... and find out nothing except that it redirects /usr/lib/x86...

So at least we know where it is.

> ldconfig -p | grep usb

... this will show where things which nominally relate to usbs live.

You can add to the libarary path by putting just any text file in /etc/ld.so.cache, e.g. in Arch where the path to the fakeroot environment is placed there.

