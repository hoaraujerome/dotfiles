#!/usr/bin/env bash

set -e

cp ~/dotfiles/bash/.bash_profile ~/
cp ~/dotfiles/bash/.bashrc ~/

chsh -s /bin/bash $(whoami)
