#!/bin/sh

# HomeBrew Setup
git clone https://github.com/Homebrew/brew ~/.brew
echo 'export PATH=$HOME/.brew/bin:$PATH' >> $HOME/.zshrc
source $HOME/.zshrc

# Configure git
git config --global user.name "cRYP70n-13"
git config --global user.email "otmane.kimdil@gmail.com"
git config --global core.editor vim
git config --global color.ui true

# NOTE: and because github moved to main instead of master we can set our default branch to main
git config --global init.defaultBranch main

# Some good aliases for git
git config --global alias.hist 'log --onelie --graph'

# Move the brew folder to goinfre and symlink it
cd ~/ && mv .brew ~/.goinfre
ln -s ~/goinfre/.brew

# NOTE: Now All the stuffs that got installed with brew will move to the goinfre folder Also we can do it for the .vscode folder
# and for the .vs-kubernetes

# Install NodeJS
brew install node
npm install -g grunt-cli # I might get asked about the sudo password here but anyways let's just try it

# Install Python3.9
brew install python@3.9

# Install MongoDB
brew tap mongodb/brew
brew install mongodb-community@4.4

# Install GoLang
brew install golang
export GOPATH=$HOME/go
export GOROOT="$(brew --prefix golang)/libexec"
export PATH="$PATH:${GOPATH}/bin:${GOROOT}/bin"

# Some golang devtools
go get github.com/golang/lint/golint
go get golang.org/x/tools/cmd/godoc

# Install MySQL 
brew install mysql

# Install Postgres
brew install postgres

# Install ansible
brew install ansible

# Install minikube
brew install minikube

# Install kubectl
brew install kubectl

# Install Jenkins
brew install jenkins-lts

# To install terraform we can do it just like this
brew install terraform

# And we need to install docker
brew install docker && brew install docker-machine
docker-machine create --driver virtualbox default
docker-machine env default
eval $(docker-machine env default)

# To install gitlab-runner
brew install gitlab-runner
brew services start gitlab-runner
