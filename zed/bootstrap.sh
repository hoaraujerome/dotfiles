#!/usr/bin/env bash

set -e

brew install lazygit
brew pin lazygit

brew install --cask zed

cp ~/dotfiles/zed/*.json ~/.config/zed/

# Manually install extensions:
# - opencode
# - terraform
# - Terraform Context Server

# Sign in to get code predictions
# https://zed.dev/docs/ai/edit-prediction#edit-prediction
