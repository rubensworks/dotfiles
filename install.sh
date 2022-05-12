#!/bin/bash

if [ ! -d "$HOME/.rwdotfiles" ]; then
    echo "Installing rubensworks' dotfiles"
    git clone --depth=1 --recursive https://github.com/rubensworks/dotfiles.git "$HOME/.rwdotfiles"
    cd "$HOME/.rwdotfiles"
    dir="$HOME/.rwdotfiles"
    echo "source $dir/bashrc" >> ~/.bashrc
    echo "source $dir/vimrc" >> ~/.vimrc

    # Init .bash_profile
    if [ ! -d "$HOME/.bash_profile" ]; then
        echo "source $dir/bash_profile" >> ~/.bash_profile
    fi

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

    # Add global gitignore
    git config --global core.excludesfile $dir/.gitignore_global

    # Set template directory
    # Everything in this dir will be copied to .git if a repo is initialized.
    git config --global init.templatedir $dir/git-template

    # Install espano configs
    ln -s $HOME/.rwdotfiles/espano/config/ ~/Library/Application\ Support/espanso/config
    ln -s $HOME/.rwdotfiles/espano/match/ ~/Library/Application\ Support/espanso/match
else
    echo "rubensworks' dotfiles are already installed at $HOME/.rwdotfiles"
fi
