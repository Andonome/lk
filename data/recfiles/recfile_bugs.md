---
title: Recfile Bugs and Gotchas
tags: 
- data
- recfiles
- bugs
requires: 
- data/recfiles.md
---

# Only One Join

You can't make more than one join, so you can take the record of a book and join it with a publisher, or with an author, but not both.

This will not work:


```sh
recsel Book.rec -t Book -j Publisher -j Author -p "Title,Publisher_City,Author_City"
```

# Formatting Demands Singular Fields

You can't format a complete record with a variable number of fields.


```recfile
%rec: Person

Name: Alice
Email: alice@posteo.uk

Name: Bob
Email: bob@posteo.uk
Email: bob@gmail.com

```

If you make a template with an `Email` category, only the first is included.

```template
{{Name}} has registered the following email addresses: `{{Email}`.

```

You can select the second email, or both, but you can't select what to do with fields which may or may not exist, except make lots of calls to `recfmt` (since it ignores calls where *all* fields are empty).


```sh
recsel Person.rec -t Person -p 'Email[0]' | recfmt "{{Email[0]}}, " >> ${file}
recsel Person.rec -t Person -p 'Email[1]' | recfmt ", {{Email[1]}}" >> ${file}
echo '.' >> ${file}
```

# Foreign Keys Don't Work

Foreign keys at a website work surprisingly well.


```recfile
%rec: Person https://splint.rs/people.rec
```

...but foreign keys should be avoided, as they cause surprises.
For example, you can't use a foreign key inside a data set which you later join to.

This should be fine:

```recfile
%rec: Walk
%key: date
%type: date date
%auto: date
%type: bird rec Bird

date: Fri, 03 Jul 2026 11:21:01 +0200
bird: Bluetit

date: Wed, 15 Jul 2026 01:29:02 +0200
bird: Robin

%rec: Bird bird.rec

name: Bluetit
laden: false
```

...but it's not.
The file `bird.rec` has a proper record set, but `recutils` simply reports a memory problem.


