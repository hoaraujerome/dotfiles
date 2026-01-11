#!/usr/bin/env bash

set -e

brew install lazygit
brew pin lazygit

# https://zed.dev/blog/hidden-gems-part-2#emulate-vims-telescope-via-television
brew install ripgrep
brew pin ripgrep
brew install bat
brew pin bat
brew install television
brew pin television

brew install --cask zed

cp ~/dotfiles/zed/*.json ~/.config/zed/

# Manually install extensions:
# - opencode
# - Makefile
# - terraform
# - Terraform Context Server

# Sign in to get code predictions
# https://zed.dev/docs/ai/edit-prediction#edit-prediction
