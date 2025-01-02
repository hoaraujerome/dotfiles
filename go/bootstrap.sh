#!/usr/bin/env bash

set -e

brew install goenv

echo 'eval "$(goenv init -)"' >>~/.bash_profile

echo "Run goenv install <semver>"
