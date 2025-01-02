#!/usr/bin/env bash

set -e

brew install derailed/k9s/k9s
echo "k9s installed"

brew install kubectx
echo "source /opt/homebrew/etc/bash_completion.d/kubectx" >>~/.bash_profile
echo "kubectx with bash completion installed"
