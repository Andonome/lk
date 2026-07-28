manupdate != command -v mandb makewhatis | head -1


.PHONY: function
function: | db.rec ## Output a search function for .bashrc
	${MAKE} --silent --touch query
	printf '%s\n' 'lk(){'
	${MAKE} --silent --dry-run query | sed 's/^/\t/'
	printf '%s\n' '}'

.PHONY: query
query: db.rec ## Search the setup notes
	passes=0 count=0; until [ "$$count" -eq "1" ] || [ "$$passes" -gt 2 ] ; do \
		query="$$(recsel "${PWD}"/db.rec -p aim,tag | recsel -iq "$$query" -CP aim,tag | sort -u | fzf --preview='recsel "${PWD}"/db.rec -e "aim~{}" -P aim,cmd | lowdown -tterm')" \
		&& count="$$(recsel "${PWD}"/db.rec -q "$$query" -c )" ;\
		passes=$$(( passes + 1 )) ;\
	done \
	&& recsel "${PWD}"/db.rec -q "$$query" | recfmt -f "${PWD}/lists.fmt" | ${PAGER}

${HOME}/.local/bin/lk: db.rec
	echo '#!/bin/sh' > $@
	chmod u+x $@
	$(MAKE) function >> $@
	echo lk >> $@

.PHONY: install
install: $(local_mans) ${HOME}/.local/bin/lk ## Install local man pages
	$(manupdate)

.PHONY: uninstall
uninstall: ## Remove local man pages
	$(RM) $(local_mans) ${HOME}/.local/bin/lk
	$(manupdate)

