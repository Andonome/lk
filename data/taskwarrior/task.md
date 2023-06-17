---
title: "task"
tags: [ "Documentation", "Organization" ]
---

Set up the configuration file:

```bash
task
```

Add a task:

```bash
task add update linux
```

See which task is next:

```bash
task next
```

Note the id number.

Mark a task as started:

```bash
task start 1
```

Once finished:

```bash
task 1 done
```

# Projects

Add a project:

```bash
task add project:house buy potted plant
task add proj:house.repair buy screwdriver
task add proj:house.repair buy shelf brackets
task add pro:house.paint buy white paint
task add pro:house.paint buy red paint
task add pro:house.paint buy black paint
task add pro:house.paint buy brushes
```

## Summary

```bash
task pro:house sum
```

```bash
task burndown.daily pro:house
```

The summaries will show how fast a project is being completed, and when you can expect it to finish at the present rate.

# Tags

```bash
task add +buy toothbrush
```

You can then see only tasks which involve buying something with:

```bash
task +buy
```

# Contexts

Set three contexts by their tags:

```bash
task context define work +sa or +hr
```

```bash
task context define study +ed or +void or +rat
```

```bash
task context define home -sa -hr -ed -void -rat
```

Change to the first context.

```bash
task context work
```

Then stop.

```bash
task context none
```

# Review

View list of tasks completed in the last week:

```bash
task end.after:today-1wk completed
```

# User Defined Attributes

Make a UDA 'size'.

```bash
task config uda.size.type string
```

```bash
task config uda.size.label Size
```

```bash
task config uda.size.values large,medium,small
```

```bash
uda.size.default=medium
```

# Tricks

This command shows tasks I'm most interested in:

```bash
task next +ACTIVE or +OVERDUE or due:today or scheduled:today or pri:H
```

The command is long, so `alias` is your friend.

