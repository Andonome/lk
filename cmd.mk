
cmds != recsel command.rec -t command -G bin -CP bin | sort -u
lists = $(patsubst %,lists/%.md, $(cmds))

default += $(lists)

get_title = printf 'title: %s\n' '${1}'
get_tags = recsel -t $(basename $<) $< -G bin \
	-e 'bin = "$(1)"' -U -CP tag,bin | \
	sed 's/.*/- &/'

list_commands = recsel -t $(basename $<) $< -e 'bin = "$(1)"' | \
	recfmt -f lists.fmt

$(lists): lists/%.md: command.rec | lists/
	@printf '%s\n' '---' > $@
	@$(call get_title,$(basename $(notdir $@))) >> $@
	@printf '%s\n' 'tags: ' >> $@
	@$(call get_tags,$(basename $(notdir $@))) >> $@
	@printf '%s\n' '---' >> $@
	@$(call list_commands,$(basename $(notdir $@))) >> $@

.PHONY: cmd
cmd: $(lists) ## Big lists of commands

.PHONY: function
function: ## Output a search function for .bashrc
	${MAKE} --silent --touch query
	printf '%s\n' 'lk(){'
	${MAKE} --silent --dry-run query | sed 's/^/\t/'
	printf '%s\n' '}'

.PHONY: query
query: db.rec ## Search the setup notes
	passes=0 count=0; until [ "$$count" -eq "1" ] || [ "$$passes" -gt 2 ] ; do \
		query="$$(recsel "${PWD}"/db.rec -p aim,tag | recsel -iq "$$query" -CP aim,tag | sort -u | fzf --preview='recsel "${PWD}"/db.rec -e "aim~{}"')" \
		&& count="$$(recsel "${PWD}"/db.rec -q "$$query" -c )" ;\
		passes=$$(( passes + 1 )) ;\
	done \
	&& recsel "${PWD}"/db.rec -q "$$query" | recfmt -f "${PWD}/lists.fmt" | ${PAGER}

