#!/usr/bin/env bash

set -e

# Change default shell for current user to bash
chsh -s /bin/bash $(whoami)

echo "Restart your terminal"
