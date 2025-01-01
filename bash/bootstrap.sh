#!/usr/bin/env bash

set -e

brew install starship

# cp ~/dotfiles/bash/.bash_profile ~/
# A bash profile exists after installing homebrew
cat ~/dotfiles/bash/.bash_profile >> ~/.bash_profile
cp ~/dotfiles/bash/.bashrc ~/

mkdir ~/.config/
cp ~/dotfiles/bash/starship.toml ~/.config/
