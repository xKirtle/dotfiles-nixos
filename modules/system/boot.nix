{ ... }:

{
  boot.loader = {
    systemd-boot = {
      enable = true;
      configurationLimit = 3;
      sortKey = "z_nixos";
    };

    efi.canTouchEfiVariables = true;
  };
}
