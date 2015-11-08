#!/bin/bash
# Loads the dotfiles in this collection

DIR=$(dirname "${BASH_SOURCE[0]}" )

source $DIR/aliases
source $DIR/vendors/gradle-tab-completion/gradle-tab-completion.bash

if [ "$(uname -s)" = "Darwin" ]; then # Mac
    # Bash autocomplete, requires bash_completion to be installed via brew.
    # TODO: maybe abstract this for non-mac machines as well?
    if [ -f $(brew --prefix)/etc/bash_completion ]; then
      . $(brew --prefix)/etc/bash_completion
    fi
else # Non-Mac

fi

# Include pending changes for git repos
export GIT_PS1_SHOWDIRTYSTATE=1
# Fancy colors and console metadata, including git repo status
export PS1='\[\033[01;32m\]\u@\h\[\033[01;34m\] \w\[\033[01;33m\]$(__git_ps1)\[\033[01;34m\] 🔷 \[\033[00m\] '

PATH="$PATH:$DIR/bin/"
export PATH=$PATH
