# stow_dirs = $(wildcard */)
.PHONY : stow
stow :
	stow --target $(HOME) --verbose --restow --adopt --dotfiles .

.PHONY : restow
# verbosity goes from 0 to 4
VERBOSITY=1
stow-verbose :
	stow --verbose $(VERBOSITY) --target $(HOME) --verbose --restow --dotfiles .

.PHONY : dry-run
dry-run :
	stow --no --target $(HOME) --verbose --restow --dotfiles .

# Do this *before* moving to another directory.
.PHONY : delete
delete :
	stow --target $(HOME) --verbose --delete .
