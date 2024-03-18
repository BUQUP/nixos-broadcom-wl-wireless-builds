{ config, pkgs, ... }:

{
  imports = [
    # Minimal installation from CD/DVD module
    <nixpkgs/nixos/modules/installer/cd-dvd/installation-cd-minimal.nix>

    # GNOME graphical installation from CD/DVD module
    #<nixpkgs/nixos/modules/installer/cd-dvd/installation-cd-graphical-gnome.nix>
  ];

  # Allow unfree packages in Nixpkgs
  nixpkgs.config.allowUnfree = true;

  # Allow broken packages (commented out by default)
  #nixpkgs.config.allowBroken = true;

  # Boot configuration
  boot = {
    kernelModules = [ "wl" ];
    kernelPackages = pkgs.linuxPackages_latest;
    extraModulePackages = [ config.boot.kernelPackages.broadcom_sta ];
    blacklistedKernelModules = [ "b43" "bcma" ];
  };
}
