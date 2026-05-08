---
title: Joyous ASCII
tags: 
- fun
---

- `asciiquarium`
- `cbonsai -lim "$(fortune)"`
- `printf 'w\na\n' | ssh -tt nethack@alt.org`

```sh
cow=$(cowsay -l | sort -R | head  -1)
fortune -s | figlet | cowsay -nf $cow | lolcat
```

Watch the [Collatz Conjecture](https://en.wikipedia.org/wiki/Collatz_conjecture) collapse:

```sh
x="$(du -sc ~/.cache | tr -d '[:alpha:]' | tail -1)"
until [ "$x" -eq "1" ]; do
    test "$(( x % 2 ))" -eq 0 && x=$(( x / 2 )) || \
        x=$(( x * 3 + 1 ))
    clear -x
    figlet "$x" | lolcat
    sleep 1
done
```

[Slow down the terminal][slow] then enjoy some [old ASCII art][ascii].

[slow]: shell/slow.md
[ascii]: http://artscene.textfiles.com/vt100/

