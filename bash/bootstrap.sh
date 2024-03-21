#!/usr/bin/env bash

set -e

brew install kubernetes-cli

cp ~/dotfiles/bash/.bash_profile ~/
cp ~/dotfiles/bash/.bashrc ~/

chsh -s /bin/bash $(whoami)
