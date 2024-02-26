#!/bin/sh

sudo nix-build '<nixpkgs/nixos>' -A config.system.build.isoImage -I nixos-config=broadcom-wl-wireless-build-iso.nix
