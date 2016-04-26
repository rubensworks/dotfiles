## Dotfiles

### Install automatically:

    sh -c "`curl -fsSl https://raw.githubusercontent.com/rubensworks/dotfiles/master/install.sh`"

### Install manually:

First clone this repo.

Add the following line to your ~/.bash_profile:

    source [path_to_this_repo]/bashrc

Add the following line to your ~/.vimrc:

    source [path_to_this_repo]/vimrc

### List of scripts:

* git-init: Initalizes a new git repo with an empty repo file and an initial commit.
* sdir: Save the current working directory, so it can be loaded with the alias `ldir`.
* ldir: Load the saved working directory and set it as current directory.
* watch: Executes $1 every $2 seconds
* shorten: Shortens url $1, requires .properties to be created in the repo folder with bitly api details.

### List of aliases:

* ll = ls -l
* g = git status
* cdl = cd;ls
* gcm = git commit -m "$@"
* gau = git add -u
* gacm = git add -u && git comit -m "$@"
* gca = git commit --amend
* docker-rm = docker ps -a | grep Exited | awk '{ print $1 }' | xargs docker rm -v
* docker-cleanall = docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)

