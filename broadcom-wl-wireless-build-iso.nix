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
}
