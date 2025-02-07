---
title: "Recfiles"
tags: [ "data", "database" ]
---

## Create

Make a database for your boardgames, specifying only one field and value:

```bash
database=games.rec
n=Name
v=Vojvodina
touch $database
recins -f $n -v v $database
recsel $database

```

Insert a few more, with the estimated playtime:

```bash
recins -f Name -v Saboter -f Playtime -v 30 $database
recins -f Name -v Chess -f Playtime -v 30 $database
```

View all games, or select one by number:

```bash
recsel $database
recsel -n 0 $database
```

Each game should note whether or not you have played it yet, so you can add that field and set the default to `yes`.

```bash
f=played
v=yes
recset -f $f -a $v $database
```

...but the field is wrong, it should have a capital letter:

```bash
new_field=Played
recset -f $f --rename $new_field
```

## Read

Check how many records the database has:

```bash
recinf $database
```

Look at just the games you've never played:

```bash
recsel --expression="Played = 'no'" $database
```

Print how many, then just print the names:

```bash
recsel -e "Played = 'no'" --count $database
recsel -e "Played = 'no'" --print=Name $database
```

## Update

To change a game's `Played` field from `no` to `yes`, use `recset` to specify the number, and change that field.

```bash
num=0
f=Played
value=yes
recsel --number=$num $database
recset --number=$num -f $f --set=$value $database
```

Find all games with a playtime of `30`, and set the field `Max_Players` to `4`.

```bash
recset -e "Playtime = 40" -f Max_Players --set 50 games.rec
```

This doesn't work, because that field does not exist.
You can `--set-add` the field, to add it wherever it does not exist.

```bash
recset -e "Playtime = 40" -f Max_Players --set-add 50 games.rec
```

## Delete

Remove `Played` record from first game:

```bash
num=0
recset --number=$num -f Played --delete $database
```

You can comment the line instead of deleting it:

```bash
num=1
recset --number=$num -f Played --delete $database
recsel $database
cat $database
```

Delete an entire record:

```bash
num=2
recdel --number=$num $database
```
