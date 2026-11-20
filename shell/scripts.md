---
title: Making Scripts
tags: 
- shell
---

Make a script for your regular shell commands.

```bash
name=look
echo '#!/bin/sh' > ${name}.sh
echo 'echo "This script is called $0"' >> !$
chmod u+x $_
./$_
```

Notice the single-quotes, *not* double quotes.
