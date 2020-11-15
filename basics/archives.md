# Tar Archives

*C*reate *z*e *f*iles!

> tar czf file.tar.gz file1 file2

E*x*tract *z*e *f*iles:

> tar xzf file.tar.gz

The .tar extension means two or more files are bundled together into a single file.  The .tar.gz means compression.

Tarballs come with a number of arguments.

## More Compression

Extremely compressed files take longer to compress, but take up less disk space.

> tar cfj super-compressed.tar.bz2 file1 file2

# ssh backup

Back up an unmounted partition with ssh:

> sudo dd if=/dev/sda1 | ssh -C ghost@192.168.0.10 "dd of=/home/ghost/backup.img" status=progress

# `xz`

Install `xz`.

Unzip the image with:

> unxz void.img.xz

This then deletes the .xz file.  To keep it:

> unxz --keep void.img.xz

# `zip`

Zip file1-3, and make a zip file called 'newsip.zip'.

> zip newsip file1 file2 file3

# Automatic Backups with `find`

## `tar`

Compressing all Latex Files in /home/.

> sudo find ~ -maxdepth 4 -name "*.txt" | xargs tar cvf latex-bundle.tar.gz

## `zip`

Install `zip`.

> find /home/"$(whoami)" -type f -size -2M | xargs zip -u backup

