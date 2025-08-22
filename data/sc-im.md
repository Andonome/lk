---
title: "sc-im"
tags: [ "TUI", "data", "spreadsheet", ".csv" ]
requires: [ "vim basics" ]
---

- [Sample file](sc-im/sample.sc)

# Basic Commands

## See Cells

Cells are hard to see.
Change this with `:set autowrap`.

Make `sc-im` always autowrap:

```sh
mkdir .config/sc-im/bash
echo 'set autowrap' >> .config/sc-im/scimrc
```

## Movement

| Command                             | Key |
|:------------------------------------|:---:|
| highest part                        | H   |
| lowest part                         | L   |
| top                                 | gg  |
| most right.                         | g$  |
| most left.                          | g0  |
| insert middle                       | \   |
| insert left                         | \>  |
| insert right                        | <   |
| to to cell b4                       | gb4 |
| see all text in cells               | aa  |
| format cells so you can see it.     | f   |
| format wider right                  | fl  |
| format smaller left                 | fh  |
| format wider down                   | fj  |
| format smaller down                 | fk  |

## Edit

### Text

| Action                | Key |
|:----------------------|:---:|
| text (left align)     | <   |
| text (right align)    | >   |
| Edit existing  text   | E   |

### Meta Actions

| Action                | Key |
|:----------------------|:---:|
|  edit a number        | e   |
|  delete column        | dc  |
|  yank column          | yc  |
|  delete row           | dr  |
|  literal paste        | p   |
|  paste with format    | Pc  |
|  delete a cell        | x   |


### Functions

| Action                          | Key          |
|:--------------------------------|:------------:|
|  add A1 to A4                   | =@sum(A1:A4) |
|  average B1 to B4               | =@avg(B1:B4) |
|  maximum of those numbers       | =@max(B1:B4) |
|  minimumof those numbers        | =@min(B1:B8) |
|  multiply C1 to C8              | =@prod(C1:C8)|

### Visual

| Action                          | Key          |
|:--------------------------------|:------------:|
| Increase decimals               | f-           |
| Decrease decimals               | f+           |
