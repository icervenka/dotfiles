#!/bin/bash
# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# easier to read disk
alias df='df -h'     # human-readable sizes
alias free='free -m' # show sizes in MB

alias reload-bash="source ~/.bashrc"
alias edit-bash="nvim ~/.bashrc"

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


