---
title: "pip"
tags: [ "Documentation", "Networking" ]
---
```

Searching does not work.

Install with:

```bash
pip install [ package ]
```

Upgrade all packages

```bash
pip freeze --local | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip install -U
```

# Troubleshooting

You may need a python3 package.
In this case, try:

```bash
pip3 install [ package ]
