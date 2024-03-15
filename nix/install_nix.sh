#!/usr/bin/env bash

set -e

# https://releases.nixos.org/?prefix=nix/
export VERSION=2.21.0

# https://nixos.org/manual/nix/stable/installation/installing-binary
curl -L https://releases.nixos.org/nix/nix-$VERSION/install | sh -s -- --daemon
