#!/usr/bin/env bash

set -e

brew install hammerspoon --cask

mkdir -p ~/.hammerspoon/
cp ~/dotfiles/hammerspoon/init.lua ~/.hammerspoon

echo "In System Preferences, enable:"
echo "* \"Reduce Motion\" under Accessibility -> Display"
echo "* \"Displays have separate Spaces\" under Desktop & Dock -> Mission Control"
echo "In hammerspoon, reload config"
