---
title: "Markdown to PDF"
tags: [ "Markdown", "PDF", "Vision" ]
---

Turn a markdown file into a pdf:

```sh
lowdown -stms "$FILE".md | pdfroff -itk -mspdf > "$FILE".pdf
```

*Example:* put [this Makefile](lowdown/example.txt) in a directory, rename it `Makefile`, then do:


```sh
make example
make
```

To give the document a title, put that title in the metadata:

```sh
sed -i "1 i---" "$FILE".md
sed -i "1 ititle: $TITLE" "$FILE".md
sed -i "1 i---" "$FILE".md
lowdown -L "$FILE".md
lowdown -X title "$FILE".md
lowdown -stms "$FILE".md | pdfroff -itk -mspdf > "$FILE".pdf
```
