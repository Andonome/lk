---
title: "Recfiles"
tags: [ "data", "database" ]
---

Create a database of board games:

```bash
database=games.rec
touch $database

entry="Name: Vojvodina"
recins --record "$record" $database
```

Create, read, update, and delete:

```bash
for g in Saboter Carcassonne Chess; do
    recins -r "Name: $g" -r "Played: yes" $database
done

query=Carc
recsel --quick=$query $database
recsel -q $query $database

query=sabat
recsel --case-insensitive -q "$query" --print=Name $database

query=chess
recsel -i -q "$query" -p Name $database

new_field=Played
value=no

recset -f "$new_field" --set-add="$value" $database
recsel $database

value=yes
recset -iq $query -f "$new_field" --set=$value $database

recset -f "$new_field" --delete $database
recsel $database
```

- [Extended example](recfiles/extended.md)
- [Playing with board games data](recfiles/Board_Games.md)

# Resources

- [Recfiles for gemini capsules](gemini://tilde.town/~dozens/gemlog/21.gmi)

