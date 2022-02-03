---
title: "task"
tags: [ "Documentation", "Organization" ]
---

Set up the configuration file:

> task

Add a task:

> task add *update linux*

See which task is next:

> task next

Note the id number.

Mark a task as started:

> task start *1*

Once finished:

> task *1 done*

# Projects

Add a project:

> task add project:*house buy potted plant*
> task add proj:*house.repair buy screwdriver*
> task add proj:*house.repair buy shelf brackets*
3 task add pro:*house.paint buy white paint*
> task add pro:*house.paint buy red paint*
> task add pro:*house.paint buy black paint*
> task add pro:*house.paint buy brushes*

## Summary

> task pro:house sum

> task burndown.daily pro:house

The summaries will show how fast a project is being completed, and when you can expect it to finish at the present rate.

# Tags

> task add +buy toothbrush

You can then see only tasks which involve buying something with:

> task +buy

# Contexts

Set three contexts by their tags:

> task context define *work +sa or +hr*

> task context define *study +ed or +void or +rat*

> task context define *home -sa -hr -ed -void -rat*

Change to the first context.

> task context *work*

Then stop.

> task context none

# Review

View list of tasks completed in the last week:

> task end.after:today-1wk completed

# User Defined Attributes

Make a UDA 'size'.

> task config uda.size.type string

> task config uda.size.label Size

> task config uda.size.values large,medium,small

> uda.size.default=medium

# Tricks

This command shows tasks I'm most interested in:

> task next +ACTIVE or +OVERDUE or due:today or scheduled:today or pri:H

The command is long, so `alias` is your friend.

