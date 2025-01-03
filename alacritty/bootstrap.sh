#!/usr/bin/env bash

set -e

brew install --cask alacritty

brew install --cask font-fira-code-nerd-font

cp ~/dotfiles/alacritty/.alacritty.toml ~/

# https://pezcoder.medium.com/how-i-migrated-from-iterm-to-alacritty-c50a04705f95
# Enable smoothing on mac
defaults write -g CGFontRenderingFontSmoothingDisabled -bool NO
defaults -currentHost write -globalDomain AppleFontSmoothing -int 2
