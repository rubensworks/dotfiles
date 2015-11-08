#!/bin/bash

if [ ! -d "$HOME/.rwdotfiles" ]; then
    echo "Installing rubensworks' dotfiles"
    git clone --depth=1 https://github.com/rubensworks/dotfiles.git "$HOME/.rwdotfiles"
    cd "$HOME/.rwdotfiles"
    dir="$HOME/.rwdotfiles"
    echo -e "\nsource $dir/bashrc\n" >> ~/.bashrc
    echo -e "\nsource $dir/vimrc\n" >> ~/.vimrc

    # Make required vim directories
    mkdir -p ~/.vim/tmp/backup/
    mkdir -p ~/.vim/tmp/swap/

    # Install required stuff
    if [ ! -x "$HOME/.vim/bundle/Vundle.vim"]; then
        git clone https://github.com/VundleVim/Vundle.vim $HOME/.vim/bundle/Vundle.vim
    fi

    # Tell vim to install our configured plugins
    vim +PluginInstall +qall

    # Install binaries
    if [ "$(uname -s)" = "Darwin" ]; then # Mac

    else # NonMac
        sudo apt-get install bash-completion
        sudo apt-get install ctags # Required for the vim Taglist plugin
    fi

else
    echo "rubensworks' dotfiles are already installed at $HOME/.rwdotfiles"
fi
