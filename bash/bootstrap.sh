#!/usr/bin/env bash

set -e

cp ~/dotfiles/bash/.bash_profile ~/

chsh -s /bin/bash $(whoami)
