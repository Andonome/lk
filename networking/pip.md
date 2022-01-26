---
title: "pip"
tags: [ "Documentation", "Networking" ]
---

Searching does not work.

Install with:

> pip install [ package ]

Upgrade all packages

> pip freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip install -U

