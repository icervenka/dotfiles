#!/bin/zsh

# general use eza aliases
alias ls='eza --icons'
alias l='eza -F -lbh --icons'
alias ll='eza -F -lbGh --icons'
alias llm='eza -lbGd --sort=modified'
alias la='eza -lbhHigUmuSa --time-style=long-iso --color-scale'
alias lx='eza -lbhHigUmuSa@ --time-style=long-iso --color-scale'

# specialty views eza aliases
alias lS='eza -1'
alias lt='eza --tree --level=2'

# Colorize grep output (good for log files)
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# Colorize tool help output by bat
alias -g -- -h='-h 2>&1 | bat --language=help --style=plain'
alias -g -- --help='--help 2>&1 | bat --language=help --style=plain'

alias reload-zsh="source ~/.zshrc"
alias edit-zsh="nvim ~/.zshrc"
alias ts="tmuxinator start"
alias txkill="tmux kill-session"
alias txkilla="tmux kill-session -a"
alias cona="conda activate"
alias cond="conda deactivate"
alias conl="conda env list"
