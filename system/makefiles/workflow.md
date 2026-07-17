---
title: Makefile Workflow
tags: 
- system
- makefiles
requires:
- system/makefiles.md
---

Makefiles can quickly become large and confusing.
I found these steps keep them easy to understand later and quick to write.

```sh
mkdir blog.rs
cd !$
for x in one two three
do
	fortune > posts/$x.md
done
```

# Three Steps

* Define variables up-front so you know what they all are.
* Define dependencies and patterns next, without recipes.
* Finally, define the recipes.


```sh
## Variables

markdown_articles = $(wildcard posts/*.md)

output_articles = $(patsubst posts/%.md,public/%.html,$(markdown_articles))

.DEFAULT_GOAL = out

## Dependencies

public/%.html: posts/%.md

$(output_articles): | public/

## Recipes

%/:
	mkdir $@

public/%.html: posts/%.md
	lowdown $< > $@

.PHONY: out
out: $(output_articles)
```

## Variables

There are three types of variables which `make` recognizes.
I ignore this and only use `foo = 1 2 3` whenever possible.
These variables resolve immediately, in order.

## Dependencies

Making recipes is one thing, making dependencies should receive its own head-space.
If you get the ordering wrong, then `make` won't work, and you'll end up switching to `autoconf` or `just`, because you think there's something wrong with `make`.

An honest dependency chain allows short build times.
You may be tempted to lie in the `Makefile` to fix something which does not compile at the right time, or to split a recipe up.
But don't.
Putting in a false dependency will cause problems later, and brings shame to your ancestors.

## Recipes

### Lots of `info`

When make tells you too much, the output becomes meaningless.
Focus on what matters with `info` statements.

```sh
public/%.html: posts/%.md
    $(info Making $*)
	lowdown $< > $@

```

Now you can use `make -s` to stop the constant planning reports, but still see what's being made.

### Delete First

Recipes should be idempotent, i.e. they can run many times and the final output remains the same.
You can do this easily by deleting a target before you start.


```sh
generated/%.html: posts/%.md
    $(info Making $*)
    figlet '    $*' > $@
	lowdown $< >> $@

```

The `figlet` use destroys anything in the original file.

### Adding Variables to Recipes

Starting with concrete filenames and shifting to variables later makes writing easier.

That `public/` directory should be a variable, but that can wait until the basic logic works.
