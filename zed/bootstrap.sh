#!/usr/bin/env bash

set -e

brew install lazygit
brew pin lazygit

brew install --cask zed

cp ~/dotfiles/zed/*.json ~/.config/zed/

# Manually install opencode extension
