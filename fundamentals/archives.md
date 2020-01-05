# Automatic Backups with `find`

> find /home/"$(whoami)" -type f -size -2M | xargs zip -u backup

# Tar Archives

Create ze files:

> tar czf file.tar.gz file1 file2

Extract ze files:

> tar xzf file.tar.gz

The .tar extension means two or more files are bundled together into a single file.  The .tar.gz means compression.

Tarballs come with a number of arguments.

- c means 'create'.

- v means 'verbose'.

- f means 'this is the file' and must always be the ultimate argument.

- z means compression.

So we can compress file1 and file2 into a single tar called 'archive' with:

> tar czvf archive.tar.gz file1 file2

Extraction uses 'x' instead of 'c'.

> tar xzvf archive.tar.gz

Create a very compressed file:

> tar cfj super-compressed.tar.gz file1 file2

# Example - Compressing all Latex Files in /home/

> sudo find ~ -maxdepth 4 -name "*.txt" | xargs tar cvf latex-bundle.tar.gz

# ssh backup

Back up an unmounted partition with ssh:

> sudo dd if=/dev/sda1 | ssh -C ghost@192.168.0.10 "dd of=/home/ghost/backup.img" status=progress

# img.xz

Install `xz`.

Unzip the image with:

> unxz void.img.xz

This then deletes the .xz file.  To keep it:

> unxz --keep void.img.xz

