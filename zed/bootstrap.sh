#!/usr/bin/env bash

set -e

brew install jesseduffield/lazygit/lazygit

brew install --cask zed

cp ~/dotfiles/zed/tasks.json ~/.config/zed/

# Manually install opencode extension
