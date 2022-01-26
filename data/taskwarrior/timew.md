---
title: "timew"
tags: [ "Documentation", "Data" ]
---
# Summaries

Try:

> timew summary :yesterday

You can also use :week, :lastweek, :month, :quarter, :year, or a range such as:

> timew summary today to tomorrow

> timew today - tomorrow

> 2018-10-15T06:00 - 2018-10-17T06:00

Each of these can gain with the :ids tag.

# Basics

> timew start

> timew stop

> timew continue

> timew summary

> timew tags

And add ids with:

> timew summary :ids


> timew track 10am - 1pm timewarrior

> timew track 1pm for 2h walk

# Adjusting Timewarrior

First get ids.

> timew summary :ids

Then if we're looking at task @2:

> timew move @2 12:00

> timew lengthen @2 3mins

> time shorten @2 40mins

# Forgetting

> timew start 1h ago @4

Or if your action actually had a break:

> timew split @8

Or maybe not?

> timew join @4 @8

> timew @8 delete

Start at previous time

> timew start 3pm 'Read chapter 12'

> timew start 90mins ago 'Read chapter 12'

Cancel currently tracked time.

> timew cancel

# Backdated tracking

> timew untag @3


# Hints

* :quit - for automation

* :yes

* :color

* :fill - expand the time to fill out available time

* :adjust - automatically correct overlaps

* :ids - show id numbers


# Times

* :yesterday

* :day

* :week

* :month

* :quarter

* :lastweek

* :lastmonth

* :lastquarter

* :lastyear



# Mistakes

task end.after:2015-05-01 and end.before:2015-05-31 completed

task end.after:today-1wk completed

# Errors with Python3

Replace 

`os.system('timew start ' + combined + ' :yes')`

with:

`os.system('timew start ' + combined.decode() + ' :yes')`

and 

`os.system('timew stop ' + combined + ' :yes')`

with:

`os.system('timew stop ' + combined.decode() + ' :yes')`

# Fixing Errors

> curl -O https://taskwarrior.org/download/timew-dbcorrection.py

> python timew-dbcorrections.py

# Setup

With taskwarrior installed as well, `locate on-modify-time`, then add it to ~/.task/hooks and make it executable.
This will track the time of any tasks used with [taskwarrior](task.md).

