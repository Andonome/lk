MAKEFLAGS += -j
MAKEFLAGS += -s
EDITOR ?= vi
FZF != command -v sk || command -v fzy || command -v fzf || \
	{ echo install a fuzzy finder && exit 1 ;}

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

$(foreach dir, $(categories), \
	$(eval .dbs/$(dir).rec: $(wildcard $(dir)/*)) \
	)

.dbs/:
	mkdir $@
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

default += db.rec

.git/info/exclude: $(default)
	echo $^ | tr ' ' '\n' > $@

default += .git/info/exclude

.PHONY: database
database: $(default) ## Make a recfiles database

.PHONY: article
article: ## Write an article
	@path=$$(find $(categories) -type d | sort | uniq | $(FZF)) ;\
	read -p "Title: " title ;\
	filename="$$(echo "$$title" | tr '[:upper:]' '[:lower:]' | tr ' ' '_')" ;\
	printf '%s\n' '---' >> $$path/$$filename.md ;\
	printf 'title: "%s"\n' "$$title" >> $$path/$$filename.md ;\
	printf 'tags: [ "%s" ]\n' "$$path" | tr '[:upper:]' '[:lower:]' | sed 's#\/#", "#g' >> $$path/$$filename.md ;\
	printf '%s\n\n' '---' >> $$path/$$filename.md ;\
	$(EDITOR) +5 "$$path/$$filename.md"

.PHONY: clean
clean: ## Remove all generated files
	$(RM) $(default)
