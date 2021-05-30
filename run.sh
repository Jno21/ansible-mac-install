#!/usr/bin/env bash
# Use : sh run.sh
set -e

CURRENT=$PWD

# install xcode
xcode-select --install

# install homebrew + homebrew cask
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
brew update

# install pip
sudo easy_install pip

# install ansible
brew install ansible

# get roles
ansible-galaxy install -r requirements.yml -p roles

# launch playbook
ansible-playbook run.playbook.yml --ask-become-pass

# install fzf completion and keybind
$(brew --prefix)/opt/fzf/install

cd $CURRENT
