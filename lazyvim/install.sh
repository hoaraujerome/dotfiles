#!/usr/bin/env bash

set -e

##############
# Requirements
##############
brew install neovim
brew install jesseduffield/lazygit/lazygit

# https://github.com/nvim-treesitter/nvim-treesitter?tab=readme-ov-file#requirements
gcc --version

# telescope.nvim
brew install ripgrep
brew install fd

##############
# Installation
##############
git clone https://github.com/LazyVim/starter ~/.config/nvim

rm -rf ~/.config/nvim/.git

##############
# Start neovim with nvim
# It is recommended to run :LazyHealth after installation.
# This will load all plugins and check if everything is working correctly.
##############
