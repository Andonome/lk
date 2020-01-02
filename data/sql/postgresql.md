# Setup

Install postgres and start it as a service, then start with:

> psql

## Make a database as the new user postgres

> sudo su postgres

> [postgres] echo $HOME

> [postgres] 

> [postgres] CREATE DATABASE dvdrental;

## Sample Data

Get sample data.

> wget http://www.postgresqltutorial.com/wp-content/uploads/2019/05/dvdrental.zip

And then get the pdf mapping the sample data:

> wget http://www.postgresqltutorial.com/wp-content/uploads/2018/03/printable-postgresql-sample-database-diagram.pdf

Unzip and load sample data:

> unzip dvdrental.zip

> sudo su postgres


> [postgres] $ pg_restore -U postgres -d dvdrental dvdrental.tar


> [postgres] 

# Commands

## Basics

List available databases.

> \l

You'll see a list of available databases like:

`dnd`

`dvdrentals`

Then you can connect to one:

> \c dvdrental

And have a look at what tables it has:

> \d dvdrental

If it has tables such as `language`, `film_actor` and `inventory`, you can see the table's settings with:

> \dt film_actor

And pull back the entire table:

> SELECT * from film_actor;

## Various

Connect to 231.13.48.38 with user 'bob', port 1234, database 'X'

> psql -h 231.13.48.38 -p1234 -U bob X

# Setup Yourself

Make database "test" and connect to it.

> CREATE DATABASE test;

> \l test

Delete database 'dogs':

> DROP DATABASE dogs;

Making a table has a basic form of:

`CREATE TABLE table_name (`

then [ column name ] + [data type ] ... (and possibly data constraints)

`)`

|Data Types | Meaning | Constraints |
|:----|:----|:----|
| BIGSERIAL | A number incrementing by one each entry | 'NOT NULL PRIMARY  KEY (so it's used for relational reference) |
| int | integer | (50) limits the table to 50, e.g. `int(50)`|
| VARCHAR | any characters | limit, e.g.`VARCHAR(70)`|
| TIMESTAMP | time | |
| date | date | |
| text | text? | |
| tsquery | text search query | |
| money | money | |
| json | textual JSON data | |
| cidr | ipv4 or 6 address | |
| macaddr | mac address | |


E.g.

```
CREATE TABLE character (
id int,
str int(1),
dex int(1),
spd int(1),
int int(1),
wts int(1),
cha int(1));

```

See your table:

> \d

Look at what columns you have there:

> \d character

But this allows for empty characters, so...

```

CREATE TABLE person (
	id BIGSERIAL NOT NULL PRIMARY KEY,
	first_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	last_name VARCHAR(50) NOT NULL,
	gender VARCHAR(7) NOT NULL,
	date_of_birth DATE NOT NULL,
);

```

Delete with

> DROP TABLE person;

## Inserting Data

```

INSERT INTO person (
	first_name,
	last_name,
	gender,
	date_of_birth)
VALUES ('Hugi','Smith','DWARF', date '200-01-12');

```

## Selecting Data
You can also mass select by choosing to insert a file.  Download example data [here](https://mockaroo.com/).

> \i /home/ghost/file.sql

Various querries:

> SELECT * FROM person;

> SELECT * FROM person ORDER BY id DESC;

> SELECT * FROM person 

## Offset, Fetch and Limit

'Limit' is not official, but was accepted later:

> SELECT * FROM person ORDER BY country ASC LIMIT 10;

The official way to make a limit is 'FIRST 5 ROWS ONLY:

> SELECT * FROM person OFFSET 5 FETCH FIRST 5 ROWS ONLY;

> SELECT * FROM person where gender = 'Male' AND ( country_of_birth = 'Poland' OR country_of_birth = 'China');

Miss out the first 5 result with 'OFFSET 5'.

> SELECT p\* FROM PERSON WHERE gender = 'Female' AND country_of_birth = 'Kosovo' OFFSET 5;

> SELECT * FROM person OFFSET 5 FETCH FIRST 7 ROW ONLY;

## Advanced Selection

This query takes a lot of typing:

> SELECT * FROM person WHERE country_of_birth = 'China' 
> OR country_of_birth = 'Kosovo'
> OR country_of_birth = 'Brazil';

You can write the same thing with less typing:

> SELECT *
> FROM person
> WHERE country_of_birth in ('China','Kosovo','Brazil');

> SELECT * FROM person
> WHERE date_of_birth
BETWEEN DATE '2018-04-10' AND '2019-01-01' 
> ORDER BY date_of_birth;

### Rough Search

Similar words - we can find emails ending in '.com'.

> SELECT * FROM person
> WHERE email LIKE '%.com';

Or any gmail address:

> SELECT * FROM person
> WHERE email LIKE '%@gmail.%';

Or particular characters, where three precede 'gmail.com' and it's case insensitive:

> SELECT * FROM person
> WHERE email iLIKE '\_\_\_@gmail.com';

### Groups and Aggregates

Select all countries as a complete mess:

> SELECT country_of_birth FROM person;

Select countries with proper grouping:

> SELECT country_of_birth FROM person GROUP BY country_of_birth;

Select countries and count instances:

> SELECT country_of_birth, COUNT(\*) FROM person GROUP BY country_of_birth ORDER BY country_of_birth;

Also select a minimum number with 'having'. What you have must be before 'order by'.

> SELECT country_of_birth, COUNT(\*) FROM person GROUP BY country_of_birth HAVING COUNT(\*) > 5;

> SELECT country_of_birth, COUNT(\*) FROM person GROUP BY country_of_birth HAVING COUNT(\*) >= 10;

Other aggregates include 'max', 'min'.

Select most expensive car:

> SELECT MAX(price) FROM car;

> SELECT MIN(price) FROM car;

> SELECT AVG(price) FROM car;

We can stick items together for better grouping:

> SELECT make, model, MAX(price) FROM car GROPU BY make, model;

Select all fields from table 'car', and add a column containing another price, discounted to 90%, rounded to two decimal places.

> SELECT id,make,model,price,ROUND(price * .9, 2) from car;

Same thing, but take 10% of the price from the price.

> SELECT id,make,model,price,ROUND(price - (price * .1), 2) from car;



## Comparison

> SELECT 10 + 2^2;

> SELECT 10! * 2 - 3;

... et c.

This returns false:

> SELECT 1 = 1;

These return false:

> SELECT 2<1;

Or '1 is not equal to 1':

> SELECT 1<>1;

And with strings, 'G is not the same as g':

> SELECT 'G'<>'g';

### Car Disconts

You want to show the discounts on various cars.  You check which columns are available and select all of them:

> \d car

> SELECT id,make,model,price FROM car;

## Aliases

You can change what a column name appears as with:

> select price AS original_price from car;

# Null Values

## Coalesce

You can input a series of entries, requesting the first one which is present.  Here we input three entries which are 'null', and a third which is '2', so '2' is selected:

> SELECT COALESCE(null, null, 2) AS number;

When selecting column 'email' from table 'person', you can input the string 'Email not provided' if there is no email provided:

> SELECT COALESCE(email, 'Email not provided') from person;

## Nullif

Normally, devision by 0 produces an error:

> SELECT 10/ 0;

But 10 divided by 'null' produces only 'null', which is not an error.

The 'nullif' statement takes two numbers, and returns 'null' iff the numbers are the same as each other.

> select nullif(0,0)
> select nullif(10,10)

# Date

Select date:

> SELECT NOW()::DATE;

> SELECT NOW()::TIME;

or just:

> SELECT NOW();

More [here](postgresql.org/docs/11/datatype-datetime.html).


2h23m

