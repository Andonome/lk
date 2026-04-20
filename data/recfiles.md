---
title: Recfiles
tags: 
- data
- database
---

Create:

```sh
database=games.rec
touch $database
for g in Vojvodina Saboter Carcassonne Chess; do
    recins -r "Name: $g" -r "Played: yes" $database
done
```

Read:

```sh
recsel $database
query=Carc
recsel --quick=$query $database

game=Vojvodina
recsel --expression="Name = '${game}'" $database
```

Update:

```sh
recset --expression="Name = '${game}'" -f Played --set="no" $database
new_field=Played
value=no
recset -f "$new_field" --delete $database
recset -f "$new_field" --set-add="$value" $database
recsel $database
```

Delete:

```sh
recdel --expression="Name = '${game}'" $database
recset -f "$new_field" --delete $database
```

- [Extended example](recfiles/extended.md)
- [Playing with board games data](recfiles/board_games.md)
- [Playing with IP addresses](recfiles/ip_asn.md)
- [Manage LaTeX Bibliographies](recfiles/bibliography.md)
- [Fixes](recfiles/recfixes.md)

# Resources

- [Recfiles for gemini capsules](gemini://tilde.town/~dozens/gemlog/21.gmi)

