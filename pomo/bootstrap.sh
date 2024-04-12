#!/usr/bin/env bash

# https://youtu.be/wtRJGkPZ2gM?feature=shared

set -e

ARCH=$(uname -m)

if [[ "$ARCH" == "x86_64" ]]; then
	ARCH="amd64"
fi

curl -L https://github.com/rwxrob/pomo/releases/download/v0.2.3/pomo-darwin-$ARCH -o ~/.local/bin/pomo
chmod u+x ~/.local/bin/pomo

~/.local/bin/pomo init
~/.local/bin/pomo var set duration "50m"
~/.local/bin/pomo var set interval ""
