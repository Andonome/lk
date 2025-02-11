---
title: "character-encoding"
tags: [ "System" ]
---
Convert a text file from one encoding type to another with:

```bash
iconv -f ascii -t utf8 oldfilename > newfilename
```

Available options are:

* ISO-8859-15

* UTF-8

* ASCII

* Lots more

Generate a full list of encoding types available with:

```bash
iconv -l
```

