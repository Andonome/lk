---
title: "task"
tags: [ "Documentation", "data" ]
---
# Contexts

Set three contexts by their tags:

> task context define work +sa or +hr

> task context define study +ed or +void or +rat

> task context define home -sa -hr -ed -void -rat

Change to the first context.

> task context work

Then stop.

> task context none

# Review

View list of tasks completed in the last week:

> task end.after:today-1wk completed

# Timewarrior

> timew start ed 'learn timewarrior'

> timew stop

> timew summary

> timew tags

# User Defined Attributes

Make a UDA 'size'.

> task config uda.size.type string

> task config uda.size.label Size

> task config uda.size.values large,medium,small

> uda.size.default=medium

