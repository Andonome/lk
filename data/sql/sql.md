MySQL, Aurora and the Maria Database work similarly, and mostly with the same commands.

MySQL requires 160 Megs of disk space.

The ontological layers go:

> Database > table > record > field

The record is a line containing multiple fields.  The table contains multiple records.

## Database: RPGs

### Table: D&D

#### Columns: 

| id | name               | year | edition | stars |
|:--:|:-------------------|:-----|:--------|:------|
| 1  | Dungeons & Dragons | 1975 | 1       | 1     |
| 2  | Dungeons & Dragons | 1980 | 2       | 1     |
| 3  | Advanced Dungeons & Dragons | 1985 | 1       | 1     |


# Getting started

> sudo apt-get install mysql-server

You'll be asked for a password.

Log in with:

> mysql -u root -p

The -u requests a user, while -p tells it to prompt for a password.

List all databases:

> show databases;

Make a new database;

> create database creatures;

Start work on the new database:

> use creatures;

> create table stats (Strength VARCHAR(2), Speed VARCHAR(2), Dexterity(2));

This creatures a row called 'stats' within the 'creature'table' with a number of variables, all of type VARCHAR (a variable length character string).

Now you can insert data (which would normally be provided by a user via php or some-such).

> insert into stats (Strength,Speed,Dexterity) values (-1,0,+1)

Now have a look at the info:

> select * from stats

The old way to delete info by selection was:

> delete * from stats where Charisma='0'

...but now it's:

> delete from stats where Charisma='0'

Update a thing:

> update stats

> set Speed='-1',Charisma='-2'

> where Strength=0;

Leaving out the specifier 'where' means you're updating the entire database.

Control order with

> SELECT * FROM stats ORDER BY Strength;

Or for descending order, suffix 'DESC'.

> select * from stats ORDER by Date DESC;

# Resources

Try more at [w3schools](http://www.w3schools.com/sql/sql_groupby.asp).


