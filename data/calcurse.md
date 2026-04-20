---
title: calcurse
tags: 
- data
- calendar
- daylight savings
---

## Setup

The UK government keeps an `ics` file with clock.

```sh
wget https://www.gov.uk/when-do-the-clocks-change/united-kingdom.ics
calcurse -i united-kingdom.ics
```

