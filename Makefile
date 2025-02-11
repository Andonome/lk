help: ## Print the help message
	@awk 'BEGIN {FS = ":.*?## "} /^[0-9a-zA-Z._-]+:.*?## / {printf "\033[36m%s\033[0m : %s\n", $$1, $$2}' $(MAKEFILE_LIST) | \
		sort | \
		column -s ':' -t

articles != find * -type f -name "*.md"

db.rec: $(articles)
	for x in $^ ; do \
	sed -n '2,/^---$$/ {/^---$$/d; p}' "$$x" |\
	tr -d '"[]' ;\
	printf "file: %s\n\n" "$$x" ;\
	done > $@

default += db.rec

.git/info/exclude: $(default)
	echo $^ | tr ' ' '\n' > $@

default += .git/info/exclude

.PHONY: database
database: $(default) ## Make a database for recfiles

.PHONY: article
article: ## Write an article
	@path=$$(find . -type d -printf '%P\n' | fzy); \
	read -p "Title: " title; \
	printf '%s\n' '---' >> $$path/$$title.md ; \
	printf 'title: "%s"\n' "$$title" >> $$path/$$title.md ; \
	printf 'tags: [ "%s" ]\n' "$$path" | sed 's#\/#", "#g' >> $$path/$$title.md ; \
	printf '%s\n\n' '---' >> $$path/$$title.md ;\
	$(EDITOR) +5 $$path/$$title.md

.PHONY: clean ## Remove all generated files
clean:
	$(RM) $(default)
