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
* curltime: Measures how long a curl request takes
* tex2svg: Converts a TeX file to SVG
* timeperf: Like `time`, but takes the best of five runs
* npm-release: A convenience script for publishing and pushing a new npm package release

### List of aliases:

* ll = ls -l
* g = git status
* cdl = cd;ls
* gcm = git commit -m "$@"
* gcnm = git commit -m "$@"
* gau = git add -u
* gacm = git add -u && git comit -m "$@"
* gca = git commit --amend
* gr = git remote -v
* gplom = git pull origin master
* gpsom = git push origin master
* docker-rm = docker ps -a | grep Exited | awk '{ print $1 }' | xargs docker rm -v
* docker-cleanall = docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)
* docker-cleanimgs = Removes all untagged docker images
* is-mac = If running on a mac
* docker-init = Set your docker environment variables, Kinematic must be started.
* transfer-pub-key = Transfer your public key to $1, so $1 should be in the form of "username@hostname"
* json = python -m json.tool
* find-largest = Find the 15 largest files in the given folder
* git-rm-pushed-tag = Delete a pushed git tag

