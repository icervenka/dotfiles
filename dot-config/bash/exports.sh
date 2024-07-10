#!/bin/bash
# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

export EDITOR="nvim"
export PATH="/usr/local/bin":"/snap/bin":$PATH
export PATH="$HOME/.local/bin":$PATH
export DOTFILES="$HOME/code/dotfiles"

export ITERM_ENABLE_SHELL_INTEGRATION_WITH_TMUX=1

export CONFIG=$XDG_CONFIG_HOME
