{ pkgs, ... }:

let
  u = import <nixos-unstable> {
    system = pkgs.stdenv.hostPlatform.system;
    config.allowUnfree = true;
  };
in {
  # Use the unstable kernel to match the NVIDIA driver from <nixos-unstable>. Comment out to fallback to the stable kernel.
  boot.kernelPackages = u.linuxPackages;

  boot.loader = {
    systemd-boot = {
      enable = true;
      configurationLimit = 3;
      sortKey = "z_nixos";
    };

    efi.canTouchEfiVariables = true;
  };
}
