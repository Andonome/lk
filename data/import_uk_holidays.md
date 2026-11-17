---
title: Import an ICS file into calcurse
tags: 
- data
- calendar
- daylight savings
requires:
- calcurse
---

## Setup

The UK government keeps an `ics` file with clock.

```sh
wget https://www.gov.uk/when-do-the-clocks-change/united-kingdom.ics
calcurse -i united-kingdom.ics
```

If you already have some of these events, and don't want duplicates, import the events into a temporary file.


```sh
TMP=$(mktemp)
curl -s "$1" | calcurse -q -i - -c "$TMP"
```

Then search for new lines in the new calendar file to put into your appointments file.

```sh
CALDATA=~/.local/share/calcurse/apts
grep -vf "$CALDATA" "$TMP" >> "$CALDATA"
rm $TMP
```
