---
title: Base 16
tags: 
- data
---

Base 16 numbers often use `0x` at the start, so '10' just means '10', but `0x10` means '10 in base 16' which means '16'.

For small numbers, use `printf`.

```sh
printf "%x" $NUMBER
```

For any number, use `bc`.


```sh
fortune | md5sum  | cut -d' ' -f1 | tr [:lower:] [:upper:] | bc
```

- Inputting base 16 uses `ibase=16`.
- Outputting base 10 uses `ibase=10`

```sh
echo 'ibase=16;' $(echo cbb478ac825f0dce7671254be035d0bc | tr [:lower:] [:upper:]) | bc
```
