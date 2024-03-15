#!/usr/bin/env bash

set -e

brew install --cask alacritty

brew tap homebrew/cask-fonts
brew install --cask font-ubuntu-mono-nerd-font

cp ~/dotfiles/alacritty/.alacritty.toml ~/
