{ ... }:

{
  networking = {
    hostName = "beepbopbop";
    networkmanager.enable = true;
  };

  services.resolved.enable = true;
  nix.settings.download-buffer-size = 524288000; # https://github.com/NixOS/nix/issues/11728
}
