{ pkgs, ... }:

let
  u = import <nixos-unstable> {
    system = pkgs.stdenv.hostPlatform.system;
    config.allowUnfree = true;
  };
in {
  boot.kernelPackages = u.linuxPackages; # Comment out to fallback to the stable kernel.
  boot.kernelParams = [ "mem_sleep_default=deep" ]; # S3/deep seems to be more reliable than s2idle

  boot.loader = {
    systemd-boot = {
      enable = true;
      configurationLimit = 3;
      sortKey = "z_nixos";
    };

    efi.canTouchEfiVariables = true;
  };
}
