#!/bin/sh

# general use exa aliases
alias ls='exa --icons'
alias l='exa -lbFh --icons'
alias ll='exa -lbGFh --icons'
alias llm='exa -lbGd --sort=modified'
alias la='exa -lbhHigUmuSa --time-style=long-iso --color-scale'
alias lx='exa -lbhHigUmuSa@ --time-style=long-iso --color-scale'

# specialty views exa aliases
alias lS='exa -1'
alias lt='exa --tree --level=2'

# Colorize grep output (good for log files)
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# Colorize tool help output by bat
alias -g -- -h='-h 2>&1 | bat --language=help --style=plain'
alias -g -- --help='--help 2>&1 | bat --language=help --style=plain'

alias reload-zsh="source ~/.zshrc"
alias edit-zsh="nvim ~/.zshrc"
