MAKEFLAGS += -j
MAKEFLAGS += -s
EDITOR ?= vi
FZF != command -v sk || command -v fzy || command -v fzf || \
	{ echo install a fuzzy finder && exit 1 ;}

ifeq "$(FZF)" "/usr/bin/fzy"
  FZF += -i
else
  FZF += --print-query | tail -1
endif

spill_contents = sed -e '1,/---/d'

help: ## Print the help message
	@awk 'BEGIN {FS = ":.*?## "} /^[0-9a-zA-Z._-]+:.*?## / {printf "\033[36m%s\033[0m : %s\n", $$1, $$2}' $(MAKEFILE_LIST) | \
		sort | \
		column -s ':' -t

articles != find * -type f -name "*.md"

dirs != ls -d */
categories = $(patsubst %/, %, $(dirs))

databases = $(patsubst %, .dbs/%.rec, $(categories))

default += $(databases)
default += db.rec
default += .dbs/map.fmt

$(foreach dir, $(categories), \
	$(eval .dbs/$(dir).rec: $(wildcard $(dir)/*)) \
	)

%/:
	mkdir $@
	echo '*' > $@.gitignore

include cmd.mk

$(databases): .dbs/%.rec: %/ | .dbs/
	$(info making $(@F))
	for entry in $(shell find $< -type f -name "*.md") ; do \
		printf "file: %s\n" "$$entry" ;\
		sed -n '2,/^---$$/ {/^---$$/d; p}' "$$entry"  |\
		tr -d '[]' | tr -s ' ' |\
		sed '/tags: /s/, /\ntag: /g ; s/tags:/tag:/ ; /requires/s/, /\nrequires: /g' ;\
		printf "wordcount: %s\n\n" "$$(wc -w < $$entry)" ;\
	done > $@

# This two-variable read can only happen because of the quotes in the titles.
db.rec: $(databases)
	$(info rebuilding from $? )
	printf '%s\n' '%rec: guide' > $@
	printf '%s\n' '%key: title' >> $@
	printf '%s\n' '%type: requires rec guide' >> $@
	printf '%s\n' '%type: provides rec guide' >> $@
	printf '%s\n' '%type: wordcount int' >> $@
	printf '%s\n\n' '%sort: wordcount' >> $@
	cat $^ >> $@
	recsel $@ -e "requires != ''" -CR title,requires |\
	while read title requires; do \
		for provider in "$$requires" ; do \
			recset $@ -e "title = '$${provider}'" -f provides -a "$${title}" ;\
		done ;\
	done
	sed -i 's/"//g' $@
	recfix --sort $@
	$(info Created main database: $@)

.git/info/exclude: $(default)
	@echo $^ | tr ' ' '\n' > $@

default += .git/info/exclude

.PHONY: database
database: $(default) ## Make a recfiles database

.dbs/map.fmt:| .dbs/
	printf '%s\n' '[ {{requires[0]}} ] --> [ {{title}} ] {border-style: dashed;}' > $@
	printf '%s\n' '[ {{requires[1]}} ] --> [ {{title}} ] {border-style: dashed;}' >> $@
	printf '%s\n' '[ {{requires[2]}} ] --> [ {{title}} ] {border-style: dashed;}' >> $@
	printf '%s\n' '[ {{requires[3]}} ] --> [ {{title}} ] {border-style: dashed;}' >> $@
	printf '%s\n' '[ {{requires[4]}} ] --> [ {{title}} ] {border-style: dashed;}' >> $@

.PHONY: map
map: db.rec .dbs/map.fmt ## Show knowledge dependency map
	recsel -t guide $< -e 'requires != ""' -p title,requires | recfmt -f .dbs/map.fmt |\
	grep -vF '[  ]' | graph-easy --boxart | $${PAGER}

.PHONY: clean
clean: ## Remove all generated files
	$(RM) $(default)

.PHONY: article
article: **/ **/**/ ## Write a new article
	category=$(shell echo $^ | tr ' ' '\n' | $(FZF) ) \
	&& read -p "Article title? " name \
	&& filename="$$(echo "$$name" \
		| cut -d: -f1 \
		| tr -cd '[:alpha:]' | tr '[A-Z ]' '[a-z_]' )" \
	&& $(MAKE) -e TITLE="$$name" "$$category"/"$$filename.md"

%.md: 
	[ -d "$(@D)" ] || mkdir $(@D)
	printf '%s\n' '---' >> $@
	printf 'title: %s\n' '$(TITLE)' >> $@
	tags="$$(echo $(@D) | sed 's#/$$#"# ; s#/#", "#g ; s#^#"#' )" \
	&& printf 'tags [ %s ]\n' "$$tags" >> $@
	printf '%s\n\n' '---' >> $@
	$(EDITOR) +5 $@
	git add $@
	git commit -m"article: $(TITLE)"

