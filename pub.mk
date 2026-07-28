
markdown = $(wildcard */*.md */*/*.md)

publish = $(patsubst %, .publish/%, $(markdown))

.dbs/requires.fmt: | .dbs/
	echo "- [{{requires_title}}]({{requires_path}})" > $@

$(publish): .publish/%.md: %.md | .dbs/notes.rec .dbs/requires.fmt
	$(info Publishing $(*D): $(*F) )
	mkdir -p $(@D)
	sed -n '1,/^---$$/p' $< > $@
	test "$$(recsel -t guide -j requires .dbs/notes.rec -e "path = '$<'" -c)" -lt 1 \
	|| { printf '\n---\n%s\n\n' "**Requirements**" >> $@ \
	&& recsel -t guide -j requires .dbs/notes.rec -e "path = '$<'" -p requires_title,requires_path | recfmt -f .dbs/requires.fmt >> $@ \
	&& printf '\n%s\n\n' '---' >> $@ ;}
	sed '1,/---/d' $< >> $@

cmds != recsel command.rec -t command -G bin -CP bin | sort -u
lists = $(patsubst %,.publish/lists/%.md, $(cmds))

get_title = printf 'title: "Rundown: %s"\n' '${1}'
get_tags = recsel -t $(basename $<) $< -G bin \
	-e 'bin = "$(1)"' -U -CP tag,bin | \
	sed 's/.*/- &/'

list_commands = recsel -t $(basename $<) $< -e 'bin = "$(1)"' | \
	recfmt -f lists.fmt

.publish/lists/:| .publish/

$(lists): .publish/lists/%.md: command.rec | .publish/lists/
	$(info Creating new list for $*)
	@printf '%s\n' '---' > $@
	@$(call get_title,$*) >> $@
	@printf '%s\n' 'tags: ' >> $@
	@$(call get_tags,$*) >> $@
	@printf '%s\n' '---' >> $@
	@$(call list_commands,$*) >> $@


.PHONY: publish
publish: $(lists) $(publish) ## Make HTML pages

######

mans = $(patsubst %.md, .mans/%.6, $(notdir $(markdown)))

local_mans = $(patsubst .mans/%,${HOME}/.local/share/man/man6/%,$(mans))

VPATH=$(shell echo $(categories) | tr ' ' ':')

$(mans): .mans/%.6: %.md | .mans/
	sed '3isection: 6\nvolume: 2\nsource: lk' $< \
	| lowdown -stman > $@ 

.PHONY: mans
mans: $(mans) ## Turn the guides into local man pages

${HOME}/.local/share/man/man6:
	mkdir -p $@

$(local_mans): ${HOME}/.local/share/man/man6/%: .mans/% | ${HOME}/.local/share/man/man6
	cp -flr $< $@

