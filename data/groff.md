# Basic Documents

Great a file called `name.ms`, with the following content:

```
.TL
Groff-Time
.AU
Ghost
.NH
How to Format Groff Documents.
.PP
Groff needs two new lines to show a new paragraph.

```

Then make a pdf from the document with:

`groff -ems name.ms -Tpdf > name.pdf`

The commands must be placed at the start of a line.

The available commands are:

| Result           | Command            |
|:----------------:|:-------------------|
| Section Header   |    .NH 1           |
| Subsection       |    .NH 2           |
| Subsubsection    |    .NH 3           |
| Paragraph        |    .PP             |
| Bold text        |    .B "text"       |
| Italic text      |    .I "text"       |
| Bold Italic text |    .BI "text"      |
| Author           |    .AU             |
| Title            |    .TL             |
| Start abstract   |    .AB             |
| Start an equation|    .EQ             |
| End an equation  |    .EN             |


## Equations

To format `2+2=5`, we can do:

```
.EQ
2+2=5
.EN
```

The equation shorthands are predictable:

| Symbol     | Macro   |
|:----------:|:--------|
| Greater than or equal to | >= |
| Not equal  | !=      |
| Superscript | sup {thing} |

- [List of symbols](https://www.math-linux.com/man/man7/groff_char.7.html)

### Examples

The fraction 2/5ths:

```
.EQ
\[25]
.EN
```

E=MC^2:

```
.EQ
E = MC sup 2
.EN
```

Praedicate logic:

```
.EQ
\[fa] x Rx \[te] y Syx
.EN
```

