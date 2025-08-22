---
title: "awk"
tags: [ "system", ".csv" ]
---
# Basics

See a file's contents:

Return full contents of a string:

```sh
awk '{ print }' file
```

Print the first and second column:

```sh
awk '{print$1$2}'
```

Return every line with the word 'the' (like grep):

```sh
awk '/the/{print}' file
```

Print everything containing a lowercase letter:

```sh
awk '/[a-z]/{print}' file
```

Same with numbers [0-9], or using a caret we can show lines starting with a number - ^[0-9], or ending with an uppercase letter - $[A-Z].

# Conditionals

```sh
awk '{ if($1 ~ /123/) print }' file
```

Check if the first column is equal to 1 or 2 or 3, and if so then print that line.

Grep for 'hawk' in a story:

```sh
awk '/hawk/' story.txt
```

Return any line with one or more "&" sequences:

```sh
awk '/&+/' script.sh
```

The pipe is used for 'or', so 'Orcs or drums' would be:

```sh
awk '/Orcs|Drums/' story.txt
```

Basic variables are:

- FS = Input field separator

- OFS = Output field separator

- NF = Number of fields on the current line

- NR = Number of records in the current file

- RS = Record separator

- ORS = Output record separator

- FILENAME = the file you're looking at.

So you can count the number of lines in a file, by referencing the number of 'end line' statements:

> awk 'END{print NR}' story.txt

Print line 2 from story.txt

> awk '{if(NR~/^2$/)print}' story.txt

Same, but any line starting with "2":

> awk '{if(NR~/^2/)print}' story.txt


