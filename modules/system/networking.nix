{ ... }:

{
  networking = {
    hostName = "beepbopbop";
    networkmanager.enable = true;
  };

  services.resolved.enable = true;
}
