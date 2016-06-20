#!/bin/bash

if [ ! -d "$HOME/.rwdotfiles" ]; then
    echo "Installing rubensworks' dotfiles"
    git clone --depth=1 --recursive https://github.com/rubensworks/dotfiles.git "$HOME/.rwdotfiles"
    cd "$HOME/.rwdotfiles"
    dir="$HOME/.rwdotfiles"
    echo "source $dir/bashrc" >> ~/.bashrc
    echo "source $dir/vimrc" >> ~/.vimrc

    # Make required vim directories
    mkdir -p ~/.vim/tmp/backup/
    mkdir -p ~/.vim/tmp/swap/

    # Install required stuff
    if [ ! -d "$HOME/.vim/bundle/Vundle.vim" ]; then
        git clone https://github.com/VundleVim/Vundle.vim $HOME/.vim/bundle/Vundle.vim
    fi

    # Tell vim to install our configured plugins
    echo "Installing vim plugins..."
    vim +PluginInstall +qall

    # Install binaries
    if [ "$(uname -s)" = "Darwin" ]; then # Mac
        echo "I'm on a mac!"
    else # NonMac
        echo "Installing required packages..."
        sudo apt-get install bash-completion
        sudo apt-get install ctags # Required for the vim Taglist plugin
    fi

else
    echo "rubensworks' dotfiles are already installed at $HOME/.rwdotfiles"
fi
