{ config, pkgs, ... }:

{
  imports = [
    # Minimal installation from CD/DVD module
    <nixpkgs/nixos/modules/installer/cd-dvd/installation-cd-minimal.nix>
  ];

  # Allow unfree packages in Nixpkgs
  nixpkgs.config.allowUnfree = true;

  # Boot configuration
  boot = {
    kernelModules = [ "wl" ];
    extraModulePackages = [ config.boot.kernelPackages.broadcom_sta ];
    blacklistedKernelModules = [ "b43" "bcma" ];
  };

  # Build ISO image
  isoImage = pkgs.writeScript "build-iso.sh" ''
    #!/bin/sh
    sudo nix-build '<nixpkgs/nixos>' -A config.system.build.isoImage -I nixos-config=iso.nix
  '';
}
