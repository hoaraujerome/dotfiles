#!/usr/bin/env bash

set -e

brew install starship

cp ~/dotfiles/bash/.bash_profile ~/
cp ~/dotfiles/bash/.bashrc ~/
cp ~/dotfiles/bash/starship.toml ~/.config/

chsh -s /bin/bash $(whoami)
