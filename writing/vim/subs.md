---
title: "find and replace"
tags: [ "vim", "search", "replace", "find", "TUI" ]
requires: [ "vim basics" ]
---
Search for the next and or previous occurrence of the word under your cursor with `*` and `#`.

Search and replace the first 'one' found with 'two':

`:%s/one/two/`

Run the last substitution globally:

`g&`

Same, but just replace 'one' globally:

`:%s/one/two/g`

Put quotes around every occurrence of `$HOME`:

`:%s/$HOME/"&"`

Same, but add curly brackets around `$HOSTNAME`:

`:%s/$HOSTNAME/{&}`

