#!/usr/bin/env bash

set -e

# NIX
# Install nix beforehand and standalone.
# For some reasons, the devbox embedded nix installation did not work.
export VERSION=2.28.3
curl -L https://releases.nixos.org/nix/nix-$VERSION/install | sh

# DEVBOX
# https://github.com/jetify-com/devbox/releases
export DEVBOX_USE_VERSION=0.14.2
# https://www.jetify.com/docs/devbox/installing_devbox/?install-method=macos#install-devbox
curl -fsSL https://get.jetify.com/devbox | bash
