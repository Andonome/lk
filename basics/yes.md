---
title: "yes"
tags: [ "basics" ]
---
# The Best Linux Program: `yes`

The program `yes` prints the word `yes` to your terminal until you cancel it, perhaps with 'Control + c'.
Or technically it prints `yes\n`, meaning `yes` and then a new line (like pressing the Return key).

This is extremely powerful.

If you ever want to automatically install something which persistently nags you with `do you want to do the thing? [y/N]?`, then you can just pipe `yes` into that program, and it will answer 'yes' to all questions.

```sh
yes | $INSTALL_SCRIPT_FILE.sh
```

This works best for disposable systems, like VMs or containers.
Try this on a live system, and you might find out that you should have read that message fully.

```sh
yes | yay
```

