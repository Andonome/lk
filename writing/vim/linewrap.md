---
title: "vim linewrap"
tags: [ "vim", "format", "linewrap" ]
requires: [ "vim basics" ]
---

Wrap lines in a file to 80 characters with `gqG`.

Take this markdown file:


```markdown
This is a looooooooooooooooooooooooong line, and reeeeeeeeeeeeeeding it can be a paaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaiiiiiiiiiiiiin in the aaaaaaaaaaaaaaaaaaaaaaaarse.
```

Reformat the line to the proper text width by pressing `gqw`.
The output looks like this:

```markdown
This is a looooooooooooooooooooooooong line, and reeeeeeeeeeeeeeding it can be
a paaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaiiiiiiiiiiiiin in the
aaaaaaaaaaaaaaaaaaaaaaaarse.
```

This works with chunks of text in visual mode.

Change what width the text should be:

```vim
:set textwidth=100
```

