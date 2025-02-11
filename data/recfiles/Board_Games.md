---
title: "Board Games"
tags: [ "data", "recfiles", "games" ]
---

You can play with a board games database from boardgamegeek.com.

## Download the Database

```sh
mkdir board_games
cd board_games
curl -Lo bg.zip 'https://www.kaggle.com/api/v1/datasets/download/threnjen/board-games-database-from-boardgamegeek'
unzip bg.zip
```

The header line shows fields with a bunch of colons, which will confused `recutils`, so we'll have to get rid of them.

```sh
sed -i '1s/://g' *.csv 
```

Convert the games to `.rec` format.

```sh
csv2rec games.csv > games.rec
```

## Queries

If you try to look at older games, you'll find lots of results.

```sh
recsel games.rec -e "YearPublished < 1800" -c
recsel games.rec -e "YearPublished < 1800" -Cp Name
```
But most are wrong.
The problem is games with a `YearPublished` date of `0`, probably because the year published is unknown.

```sh
recsel games.rec -e "Name = 'The Goblin King is Angry'" -p YearPublished
```

Fix the query by removing games published in '0 AD'.

```sh
recsel games.rec -e "YearPublished < 1800 && YearPublished != 0" -R YearPublished,Name
```

Or fix the database setting `YearPublished` to 'unknown':

```sh
recsel games.rec -e "YearPublished = 0" -Cp Name
recset games.rec -e "YearPublished = 0" -f "YearPublished" -S 'unknown'
```

Strategic games which work best with 3 players, sorted by Average Rating:

```sh
recsel games.rec -e "BestPlayers = 3 && CatStrategy = 1" -CR Name --sort=AvgRating
```
