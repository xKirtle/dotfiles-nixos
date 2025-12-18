{ ... }:

{
  boot.loader = {
    systemd-boot = {
      enable = true;
      configurationLimit = 10;
      sortKey = "z_nixos";
    };

    efi.canTouchEfiVariables = true;
  };
}
