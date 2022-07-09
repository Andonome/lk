---
title: "sc-im"
tags: [ "Documentation", "data" ]
---
# Basic Commands

> H = highest part
> L = lowest part
> gg = top

> g$ = most right.
> g0 = most left.

> \ = insert middle
> > = insert left
> < = insert right

gb4 = to to cell b4

> aa = see all text in cells
> f = format cells so you can see it.
> fl = format wider right
> fh = format smaller left

> fj = format wider down
> fk = format smaller down

# Edit

## Text

| Action                | Key |
|:----------------------|:---:|
| text (left align)     | <   |
| text (right align)    | >   |
| Edit existing  text   | E   |

## Meta Actions

| Action                | Key |
|:----------------------|:---:|
|  edit a number        | e   |
|  delete column        | dc  |
|  yank column          | yc  |
|  delete row           | dr  |
|  literal paste        | p   |
|  paste with format    | Pc  |
|  delete a cell        | x   |


## Functions

| Action                          | Key |
|:--------------------------------|:---:|
|  add A1 to A4      | =@sum(A1:A4) |
|  average B1 to B4      | =@avg(B1:B4) |
|  maximum of those numbers      | =@max(B1:B4) |
|  minimumof those numbers      | =@min(B1:B8) |
|  multiply C1 to C8      | =@prod(C1:C8) |

## Visual

| Action                          | Key          |
|:--------------------------------|:------------:|
| Increase decimals               | f-           |
| Decrease decimals               | f+           |
