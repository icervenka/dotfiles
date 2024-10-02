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

alias mama="mamba activate"
alias mamd="mamba deactivate"
alias maml="mamba env list"

# aliases to login to sciCORE servers
alias mountw9group="sshfs -o defer_permissions cerven0000@worker09.scicore.unibas.ch:/scicore/home/ivanek /Users/igor/Server"
alias unmountgroup="umount -f /Users/igor/Server"

alias mountw9home="sshfs -o defer_permissions cerven0000@worker09.scicore.unibas.ch:/scicore/home/ivanek/cerven0000 /Users/igor/Server_home"
alias unmounthome="umount -f /Users/igor/Server_home"

alias mountw9scicore="sshfs -o defer_permissions cerven0000@worker09.scicore.unibas.ch:/scicore/home /Users/igor/Server_scicore"
alias unmountscicore="umount -f /Users/igor/Server_scicore"

alias mounttransfer="sshfs -o defer_permissions cerven0000@transfer12.scicore.unibas.ch:/scicore/home/ivanek/cerven0000 /Users/igor/Server_transfer"
alias unmounttransfer="umount -f /Users/igor/Server_transfer"

# alias mountw9="sshfs -o defer_permissions cerven0000@worker09.scicore.unibas.ch:/scicore/home/ivanek/cerven0000 ~/Server"
# alias unmount="umount -f Server"
# alias logubu="ssh cerven0000@login12.scicore.unibas.ch"
# alias logcent="ssh cerven0000@login.scicore.unibas.ch"
