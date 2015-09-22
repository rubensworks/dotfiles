#!/bin/bash

if [ ! -d "$HOME/.rwdotfiles" ]; then
    echo "Installing rubensworks' dotfiles"
    git clone --depth=1 https://github.com/rubensworks/dotfiles.git "$HOME/.rwdotfiles"
    cd "$HOME/.rwdotfiles"
    echo "TODO: actual install, tell in README like https://github.com/skwp/dotfiles"
else
    echo "rubensworks' dotfiles are already installed at $HOME/.rwdotfiles"
fi
