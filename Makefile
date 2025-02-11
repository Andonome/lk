FZF != command -v sk || command -v fzy || command -v fzf || \
	{ echo install a fuzzy finder && exit 1 ;}

help: ## Print the help message
	@awk 'BEGIN {FS = ":.*?## "} /^[0-9a-zA-Z._-]+:.*?## / {printf "\033[36m%s\033[0m : %s\n", $$1, $$2}' $(MAKEFILE_LIST) | \
		sort | \
		column -s ':' -t

articles != find * -type f -name "*.md"

db.rec: $(articles)
	printf '%s\n' '%rec: guide' > $@
	printf '%s\n' '%type: wordcount int' >> $@
	printf '%s\n\n' '%sort: title' >> $@
	for x in $^ ; do \
		sed -n '2,/^---$$/ {/^---$$/d; p}' "$$x" |\
		sed -e 's/\[ //'  -e 's/ \]//' |\
		tr -d '"' ;\
		printf "file: %s\n\n" "$$x" ;\
	done >> $@
	for entry in $^; do \
		recset $@ -e "file = '$${entry}'" -f wordcount --set-add="$$(wc -w < $${entry})" ;\
	done
	recsel $@ -e "requires != ''" -CR title,requires |\
	while read title requires; do \
		IFS=', ' && for provider in $$requires; do \
			recset $@ -e "title = '$${provider}'" -f provides -a "$${title}" ;\
		done ;\
	done
	recfix --sort $@

default += db.rec

.git/info/exclude: $(default)
	echo $^ | tr ' ' '\n' > $@

default += .git/info/exclude

.PHONY: database
database: $(default) ## Make a recfiles database

.PHONY: article
article: ## Write an article
	@path=$$(find . -type d -printf '%P\n' | $(FZF)); \
	read -p "Title: " title; \
	printf '%s\n' '---' >> $$path/$$title.md ; \
	printf 'title: "%s"\n' "$$title" >> $$path/$$title.md ; \
	printf 'tags: [ "%s" ]\n' "$$path" | sed 's#\/#", "#g' >> $$path/$$title.md ; \
	printf '%s\n\n' '---' >> $$path/$$title.md ;\
	$(EDITOR) +5 $$path/$$title.md

.PHONY: clean
clean: ## Remove all generated files
	$(RM) $(default)
