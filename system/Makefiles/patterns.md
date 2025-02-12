
---
title: "Makefile Patterns"
tags: [ "system", "make" ]
---

Using the [basic example](../Makefile.md), you can make a complete backup of all backup files.
This file will depend upon everything inside the `$(storage_directory)`.
Unlike `bash`, you can't just say `storage_directory/*`: the pattern must be stated as a 'wildcard'.

```make
$(storage_directory)/backup.tgz: $(wildcard $(storage_directory)/*.md)
	tar czf $@ $^
```

The `make` rules start by processing variables:

```make
backups/backup.tgz: $(wildcard backups/*.md)
	tar czf backups/backup.tgz $^
```

Then the `wildcard` variable equals whichever backup files are in the `backups/` directory:

```make
backups/backup.tgz: backups/backup_29.md backups/backup_30.md
    tar czf backups/backup.tgz backups/backup_29.md backups/backup_30.md
```

The phony `backup` target should now point to this tar backup.


```make
current_minute != date +%M

storage_directory = backups

.PHONY: backup
backup: $(storage_directory)/backup.tgz
$(storage_directory)/backup.tgz: $(wildcard $(storage_directory)/*.md)
	tar czf $@ $^

README.md: Makefile
	echo "Basic makefile example." > $@
	echo "" >> $@
	echo '```' >> $@
	cat $< >> $@
	echo '```' >> $@

$(storage_directory)/backup_$(current_minute).md: README.md
	mkdir -p $(@D)
	cp $< $@

```


