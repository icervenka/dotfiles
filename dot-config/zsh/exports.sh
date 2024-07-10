#!/bin/zsh
# Manually set your language environment
# export LANG=en_US.UTF-8
# expoo My shell is $SHELL
# t LC_ALL=en_US.UTF-8

# Keep 1000 lines of history within the shell and save it to ~/.zsh_history:
HISTSIZE=1000
SAVEHIST=1000


export EDITOR="nvim"

export DOTFILES="$HOME/code/dotfiles"

export PATH="/usr/local/bin":"/snap/bin":$PATH
export PATH="$HOME/.local/bin":$PATH
export DOTFILES="$HOME/code/dotfiles"

export ITERM_ENABLE_SHELL_INTEGRATION_WITH_TMUX=1

export CONFIG=$XDG_CONFIG_HOME
