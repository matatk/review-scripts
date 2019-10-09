.PHONY: install check

ECLINT := $(shell command -v eclint 2> /dev/null)
SHELLCHECK := $(shell command -v shellcheck 2> /dev/null)

install: check
	@echo This will copy the scripts to your ~/bin/ directory
	@cp -v review.init ~/bin/
	@cp -v review.next ~/bin/
	@cp -v review.park ~/bin/
	@cp -v review.unpark ~/bin/
	@cp -v review.record ~/bin/
	@cp -v review.html.todo ~/bin/
	@cp -v review.html.done ~/bin/
	@echo To use the suggested aliases...
	@echo "    . $(CURDIR)/aliases.sh >> ~/.?shrc"

uninstall:
	-@rm -v ~/bin/review.init
	-@rm -v ~/bin/review.next
	-@rm -v ~/bin/review.park
	-@rm -v ~/bin/review.unpark
	-@rm -v ~/bin/review.record
	-@rm -v ~/bin/review.html.todo
	-@rm -v ~/bin/review.html.done

check:
ifndef ECLINT
	@echo "Please install the 'eclint' package if you want to check formatting before installing."
else
	eclint check
endif
ifndef SHELLCHECK
	@echo "Please install the 'shellcheck' package if you want to check the scripts before installing."
else
	shellcheck review.* aliases.sh
endif
