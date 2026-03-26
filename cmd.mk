
cmds != recsel command.rec -t command -G bin -U -CP bin
lists = $(patsubst %,lists/%.md, $(cmds))

default += $(lists)

get_title = printf 'title: "%s"\n' '${1}'
get_tags = recsel -t $(basename $<) $< -G bin \
	-e 'bin = "$(1)"' -U -CP tag | \
	sed 's/.*/"&",/g' | \
	tr '\n' ' ' | \
	sed 's/.*/tags: [ &]/'

list_commands = recsel -t $(basename $<) $< -e 'bin = "$(1)"' | \
	recfmt -f lists.fmt

lists/%.md: command.rec | lists/
	@printf '%s\n' '---' > $@
	@$(call get_title,$(basename $(notdir $@))) >> $@
	@$(call get_tags,$(basename $(notdir $@))) >> $@
	@printf '\n%s\n' '---' >> $@
	@$(call list_commands,$(basename $(notdir $@))) >> $@

.PHONY: cmd
cmd: $(lists) ## Bit lists of commands
