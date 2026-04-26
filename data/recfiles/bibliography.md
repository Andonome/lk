---
title: Recfile Bibliography for TeX
tags: 
- data
- database
- recfiles
- tex
requires: 
- data/recfiles.md
- writing/tex.md
- system/makefiles.md
---

Store your bibliography in a `recfile` database, then extract any part with `make`.

For example, you could store books like this in `bibliography.rec`:

```recfile
%rec: book
%key: slug

slug: thinkingexperience
author: H. H. Price
title: Thinking and Experience
year: 1953
publisher: Harvard University Press, Cambridge

slug: inventingrightwrong
author: John Leslie Mackie
title: Inventing Right and Wrong
year: 1997
publisher: Penguin Books, England

```

Run `make book` to extract `book.bib`, ready for LaTeX to use:

```bib
@book{thinkingexperience,
   author = {H. H. Price},
   title = {Thinking and Experience},
   year = {1953},
   publisher = {Harvard University Press, Cambridge},
}

@book{inventingrightwrong,
   author = {John Leslie Mackie},
   title = {Inventing Right and Wrong},
   year = {1997},
   publisher = {Penguin Books, England},
}
```

The `makefile` syntax is just a few lines (though admittedly employs some garbled shell-crud):

```make
bibs != grep -Po '%rec: \K.*' bibliography.rec
bibfiles = $(patsubst %, %.bib, $(bibs))

$(bibfiles): %.bib: bibliography.rec
	recsel $< -t $(basename $@) |\
		sed 's/slug: \(.*\)/@$(basename $@){\1,/g' |\
		sed 's/^\(\b.*\b\): \(.*\)/   \1 = {\2},/gI' |\
		sed 's/^$$/}\n/g' > $@
		echo '}' >> $@
```

Here's a longer `bibliography.rec` file, which can also produce `article.bib`:

```recfile
%rec: book
%key: slug
%type: year int
%constraint: year > -2000
%sort: year month

slug: thinkingexperience
author: H. H. Price
title: Thinking and Experience
year: 1953
publisher: Harvard University Press, Cambridge

slug: inventingrightwrong
author: John Leslie Mackie
title: Inventing Right and Wrong
year: 1997
publisher: Penguin Books, England

slug: metaphysicscontemporaryintro
author: Michael J. Loux
title: Metaphysics: A Contemporary Introduction
year: 1998
publisher: Routledge, London

slug: pluralityworlds
author: David Lewis
title: On the Plurality of Worlds
publisher: Blackwell Publishing, Oxford
year: 2001

%rec: article
%key: slug
%sort: year month

slug: genuinerealisttheory
author: John Divers
title: A Genuine Realist Theory of Advanced Modalizing
year: 1999
pages: 217–240
month: april
journaltitle: Mind
uri: https://academic.oup.com/mind/article-abstract/108/430/217/975258?redirectedFrom=fulltext
volume: 108
publisher: Harvard University Press, Cambridge

slug: twokindsmentalrealism
author: Tam\'{a}s Demeter
title: Two Kinds of Mental Realism
year: 2009
pages: 40:59-71
uri: https://www.researchgate.net/profile/Tamas_Demeter2/publication/41554923_Two_Kinds_of_Mental_Realism/links/0deec53247f5a4ae21000000.pdf
month: august
journaltitle: Journal for General Philosophy of Science
volume: 30
publisher: Harvard University Press, Cambridge

```

