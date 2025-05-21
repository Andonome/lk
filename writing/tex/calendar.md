---
title: "Calendar"
tags: [ "writing", "tex", "fun" ]
requires: [ "LaTeX Packages" ]
---

```sh
yplan $(date +%Y) > ${file}.tex
pdflatex -output-directory=/tmp/ ${file}.tex
mv /tmp/${file}.pdf .
```

