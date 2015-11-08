#!/bin/bash

if [ ! -d "$HOME/.rwdotfiles" ]; then
    echo "Installing rubensworks' dotfiles"
    git clone --depth=1 https://github.com/rubensworks/dotfiles.git "$HOME/.rwdotfiles"
    cd "$HOME/.rwdotfiles"
    dir="$HOME/.rwdotfiles/"
    echo "source $dir/bashrc" >> ~/.bash_profile
    echo "source $dir/vimrc" >> ~/.vimrc
else
    echo "rubensworks' dotfiles are already installed at $HOME/.rwdotfiles"
fi
