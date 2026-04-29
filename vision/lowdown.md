---
title: Markdown to PDF
tags: 
- markdown
- pdf
- vision
---

Turn a markdown file into a pdf:

```sh
lowdown -stms "$FILE".md | pdfroff -itk -mspdf > "$FILE".pdf
```

To give the document a title, put that title in the metadata:

```sh
sed -i "1 i---" "$FILE".md
sed -i 1 ititle: $TITLE $FILE.md
sed -i "1 i---" "$FILE".md
lowdown -L "$FILE".md
lowdown -X title "$FILE".md
lowdown -stms "$FILE".md | pdfroff -itk -mspdf > "$FILE".pdf
```
