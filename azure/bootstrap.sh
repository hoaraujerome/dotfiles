#!/usr/bin/env bash

set -e

# CLI
brew install az

echo "source /opt/homebrew/etc/bash_completion.d/az" >>~/.bash_profile

echo "Azure CLI with bash completion installed"

# kubelogin
brew install Azure/kubelogin/kubelogin

echo "Azure kubelogin installed"
