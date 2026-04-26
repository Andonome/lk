---
title: Output a LaTeX Calendar
tags: 
- writing
- tex
- fun
requires: 
- writing/tex/tex_packages.md
---

```sh
yplan $(date +%Y) > ${file}.tex
pdflatex -output-directory=/tmp/ ${file}.tex
mv /tmp/${file}.pdf .
```

