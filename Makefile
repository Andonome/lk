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

categories != ls -d */

databases = $(patsubst %/, .dbs/%.rec, $(categories))

default += $(databases)

$(databases): .dbs/%.rec: %/ | .dbs/
	$(info making $(@F))
	@mkdir -p $(@D)
	for entry in $(shell find $< -type f -name "*.md") ; do \
		sed -n '2,/^---$$/ {/^---$$/d; p}' "$$entry" |\
		sed -e 's/\[ //'  -e 's/ \]//' |\
		tr -d '"' ;\
		printf "wordcount: %s\n" "$$(wc -w < $$entry)" ;\
		printf "file: %s\n\n" "$$entry" ;\
	done > $@
	for entry in $(shell find $< -type f -name "*.md"); do \
		recset $@ -e "file = '$${entry}'" -f wordcount --set-add="$$(wc -w < $${entry})" ;\
		recset $@ -e "file = '$${entry}'" -f contents --set-add="$$($(spill_contents) $${entry})" ;\
	done

db.rec: $(databases)
	printf '%s\n' '%rec: guide' > $@
	printf '%s\n' '%type: wordcount int' >> $@
	printf '%s\n\n' '%sort: title' >> $@
	cat $^ >> $@
	recsel $@ -e "requires != ''" -CR title,requires |\
	while read title requires; do \
		IFS=', ' && for provider in $$requires; do \
			recset $@ -e "title = '$${provider}'" -f provides -a "$${title}" ;\
		done ;\
	done
	$(info Created main database: $@)
	recfix --sort $@

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
	printf 'tags: [ "%s" ]\n' "$$path" | sed 's#\/#", "#g' >> $$path/$$filename.md ;\
	printf '%s\n\n' '---' >> $$path/$$filename.md ;\
	$(EDITOR) +5 "$$path/$$filename.md"

.PHONY: clean
clean: ## Remove all generated files
	$(RM) $(default)
