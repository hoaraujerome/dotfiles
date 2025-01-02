#!/usr/bin/env bash

set -e

SECOND_BRAIN_PATH="$HOME/Library/Mobile Documents/iCloud~md~obsidian/Documents/secondbrain"

mkdir -p "$SECOND_BRAIN_PATH"

git clone https://github.com/hoaraujerome/coding.git "$SECOND_BRAIN_PATH/coding"
