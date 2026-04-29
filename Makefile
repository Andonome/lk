MAKEFLAGS += -j
MAKEFLAGS += -s
EDITOR ?= vi
PAGER ?= less -Ri
READER != command -v mdless bat glow less more pg | head -1
FZF != command -v fzf sk | head -1

markdown = $(wildcard */*.md */*/*.md)

ifeq "$(FZF)" ""
  $(info Install fzf)
endif

ifeq "$(FZF)" "/usr/bin/fzy"
  FZF += -i
endif

spill_contents = sed -e '1,/---/d'

help: ## Print the help message
	@awk 'BEGIN {FS = ":.*?## "} /^[0-9a-zA-Z._-]+:.*?## / {printf "\033[36m%s\033[0m : %s\n", $$1, $$2}' $(MAKEFILE_LIST) | \
		sort | \
		column -s ':' -t

articles != find * -type f -name "*.md"

default += .dbs/notes.rec
default += .dbs/map.fmt


%/:
	mkdir $@
	echo '*' > $@.gitignore

include cmd.mk

.dbs/head.rec: | .dbs/ $(lists)
	printf '%s\n' '%rec: guide' > $@
	printf '%s\n' '%key: path' >> $@
	printf '%s\n' '%type: requires rec guide' >> $@
	printf '%s\n' '%type: provides rec guide' >> $@
	printf '%s\n' '%type: wordcount int' >> $@
	printf '%s\n\n' '%sort: wordcount' >> $@

.dbs/new.rec: $(markdown) | .dbs/head.rec
	$(info Updating: $?)
	grep -q guide $@ 2>/dev/null || cp $| $@
	@-$(foreach entry, $?, \
		recdel -t guide $@ -e "path = '$(entry)'" 2>/dev/null ;\
	)
	for entry in $? ; do \
		echo '' ;\
		printf "path: %s\n" "$$entry" ;\
		sed -n '2,/^---$$/ {/^---$$/d; p}' "$$entry"  |\
		while read -r line; do  if [ -z "$${line#*:}" ] ; then type="$$line"; else echo "$$line" | sed -r "s/- (.*)/$$type \1/" | sed s'/tags: /tag: /' ; fi ; done ;\
		printf "wordcount: %s\n" "$$(wc -w < $$entry)" ;\
		echo 'cmd: ' ;\
		sed '1,/^---$$/d' $$entry | sed 's/^.*/+ &/' ;\
		echo '' ;\
	done >> $@

.dbs/requires.rec: .dbs/new.rec
	recinf -d $< > $@
	echo "" >> $@
	recsel $< -t guide -j requires -G requires -p 'path,title,tag,wordcount,requires_path:requires,requires_requires:requires,cmd' >> $@

.dbs/notes.rec: .dbs/requires.rec .dbs/new.rec
	recinf -d $< > $@
	echo '' >> $@
	sed '/^%/d' $^ | recsel -G path | recsel -U >> $@

default += db.rec
ignored += db.rec
db.rec: command.rec .dbs/notes.rec
	recinf -d $< > $@
	echo '' >> $@
	sed '/^%/d' $^ | recsel -U -p 'title:aim,aim,cmd,note,shell,tag,bin:tag' >> $@
	$(info Making main database: $@)


.git/info/exclude: $(ignored)
	@echo $^ | tr ' ' '\n' > $@

default += .git/info/exclude

.PHONY: database
database: $(default) ## Make a recfiles database

.dbs/map.fmt:| .dbs/
	printf '%s\n' '[ {{requires[0]}} ] --> [ {{path}} ] {border-style: dashed;}' > $@
	printf '%s\n' '[ {{requires[1]}} ] --> [ {{path}} ] {border-style: dashed;}' >> $@
	printf '%s\n' '[ {{requires[2]}} ] --> [ {{path}} ] {border-style: dashed;}' >> $@
	printf '%s\n' '[ {{requires[3]}} ] --> [ {{path}} ] {border-style: dashed;}' >> $@
	printf '%s\n' '[ {{requires[4]}} ] --> [ {{path}} ] {border-style: dashed;}' >> $@

.PHONY: map
map: .dbs/requires.rec .dbs/map.fmt ## Show knowledge dependency map
	recsel -t guide $< -e 'requires != ""' -p path,requires | recfmt -f .dbs/map.fmt |\
	grep -vF '[  ]' | graph-easy --boxart 2>/dev/null | ${PAGER} -S

.PHONY: clean
clean: ## Remove all generated files
	$(RM) -r $(default) .dbs/

.PHONY: article
article: */ */*/ ## Write a new article
	category=$(shell echo $^ | tr ' ' '\n' | $(FZF) --print-query | tail -1 ) \
	&& read -p "Article title? " name \
	&& filename="$$(echo "$$name" \
		| cut -d: -f1 \
		| tr '[A-Z ]' '[a-z_]' | tr -cd '[:alpha:]_' )" \
	&& $(MAKE) -e TITLE="$$name" "$$category"/"$$filename.md"

.PHONY: all
all: $(default) ## All file targets


%.md: 
	[ -d "$(@D)" ] || mkdir $(@D)
	printf '%s\n' '---' >> $@
	printf 'title: %s\n' '$(TITLE)' >> $@
	printf "tags: " >> $@
	echo $(@D)  | sed 's#\b\w#\n- &#g; s/\///g' >> $@
	printf '%s\n\n' '---' >> $@
	$(EDITOR) +5 $@

