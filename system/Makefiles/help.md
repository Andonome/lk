---
title: "make help target"
tags: [ "system", "make", "help" ]
---

Make your first target 'help' to give an overview of the main targets.
Running `make help` will search for text which starts with `## ` and show what that target does.

```make
help: ## Print the help message
	@awk 'BEGIN {FS = ":.*?## "} /^[0-9a-zA-Z._-]+:.*?## / {printf "\033[36m%s\033[0m : %s\n", $$1, $$2}' $(MAKEFILE_LIST) | \
		sort | \
		column -s ':' -t

clean: ## Remove generated files
	$(RM) $(defaults)
```

