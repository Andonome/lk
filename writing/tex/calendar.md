---
title: "Calendar"
tags: [ "writing", "tex", "fun" ]
requires: [ "tex_packages" ]
---

```sh
yplan $(date +%Y) > ${file}.tex
pdflatex -output-directory=/tmp/ ${file}.tex
mv /tmp/${file}.pdf .
```

