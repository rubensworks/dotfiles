## Dotfiles

### Install:
    
Add the following line to your ~/.bash_profile:

    source [path_to_this_repo]/bashrc

Add the following line to your ~/.vimrc:

    source [path_to_this_repo]/vimrc

### List of scripts:

* git-init: Initalizes a new git repo with an empty repo file and an initial commit.
* sdir: Save the current working directory, so it can be loaded with the alias `ldir`.
* ldir: Load the saved working directory and set it as current directory.

### List of aliases:

* ll = ls -l
* g = git status
* cdl = cd;ls
* gcm = git commit -m "$@"
* gau = git add -u
