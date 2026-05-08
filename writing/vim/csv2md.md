---
title: Format a CSV file as markdown in vim
tags: 
- vim
- markdown
- csv
---

The command to format CSV tables works similarly to [formatting markdown][formarkdown].

Put this in your `~/.vimrc` and use `Control + s` after highlighting a cs

```vim
vmap <C-s> :!column -ts, -o " \| "<Enter>yyp:s/[^\|:]/-/g<Enter>
```

Read a CSV file into Vim:

```vim
r ${file}.csv
```

Select the csv output:

```csv
Transaction Date,Transaction Type,Transaction Description,Debit Amount,Credit Amount
29/12/2020,DEB,NON-GBP CASH FEE,1.50
29/12/2020,DEB,NON-GBP TRANS FEE,4.60
29/12/2020,DEB,KBA BRANKOVA 34,153.85
29/12/2020,DEB,NON-GBP PURCH FEE,0.50
29/12/2020,DEB,NON-GBP TRANS FEE,0.30
29/12/2020,DEB,BIOMARKET 2,10.36
29/12/2020,DEB,NON-GBP PURCH FEE,0.50

```

Press `Control + s`:

```markdown

Transaction Date | Transaction Type | Transaction Description | Debit Amount | Credit Amount
-----------------|------------------|-------------------------|--------------|--------------
29/12/2020       | DEB              | NON-GBP CASH FEE        | 1.50         | 
29/12/2020       | DEB              | NON-GBP TRANS FEE       | 4.60         | 
29/12/2020       | DEB              | KBA BRANKOVA 34         | 153.85       | 
29/12/2020       | DEB              | NON-GBP PURCH FEE       | 0.50         | 
29/12/2020       | DEB              | NON-GBP TRANS FEE       | 0.30         | 
29/12/2020       | DEB              | BIOMARKET 2             | 10.36        | 
29/12/2020       | DEB              | NON-GBP PURCH FEE       | 0.50         | 
```

[formarkdown]: writing/vim/md_columns.md
