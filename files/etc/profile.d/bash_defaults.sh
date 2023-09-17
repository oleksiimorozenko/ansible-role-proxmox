#! /bin/bash
# Enable vi mode
set -o vi

# Useful aliases
alias reset="printf '\33c\e[3J' && reset"
alias dc="cd"

# Set vim as the default editor if it exists. If not, set vi
if [[ -z "$(which vim)" ]]; then
    EDITOR="$(which vi)"
else
    EDITOR="$(which vim)"
fi
VISUAL="${EDITOR}"
export EDITOR
export VISUAL
# check if stdout is a terminal...
if test -t 1; then
    # see if it supports colors...
    ncolors=$(tput colors)
    if test -n "$ncolors" && test "$ncolors" -ge 8; then
        PS1="\[$(tput bold)$(tput setaf 2)\]\u@\h\[$(tput sgr0)\]:\[$(tput bold)$(tput setaf 4)\]\w \\$ \[$(tput sgr0)\]"
        export PS1
        if [ -x "$(which dircolors)" ]; then
            if test -r ~/.dircolors; then
                eval "$(dircolors -b ~/.dircolors)"
            else
                eval "$(dircolors -b)"
            fi
            alias ls='ls --color=auto'
            alias l='ls -al'
            alias grep='grep --color=auto'
            alias fgrep='fgrep --color=auto'
            alias egrep='egrep --color=auto'
        fi
    fi
fi
