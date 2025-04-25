#!/usr/bin/env bash

set -e

##############
# Requirements
##############
brew install neovim
brew install jesseduffield/lazygit/lazygit

# LazyHealth
brew install gnu-sed

# Markdown extra
brew install markdownlint-cli2
cp .markdownlint-cli2.yaml ~/

# Yamlfmt configuration
mkdir -p ~/.config/yamlfmt
cp .yamlfmt ~/.config/yamlfmt

# https://github.com/nvim-treesitter/nvim-treesitter?tab=readme-ov-file#requirements
gcc --version

# telescope.nvim
brew install ripgrep
brew install fd

# fzf-lua
brew install fzf

# luarocks
brew install luarocks

##############
# Installation
##############
rm -Rf ~/.config/nvim.bak || true
mv ~/.config/nvim{,.bak} || true
cp -R ~/dotfiles/lazyvim/nvim ~/.config

echo "Installation done."
echo "It is recommended to run :LazyHealth after installation."
echo "This will load all plugins and check if everything is working correctly."
