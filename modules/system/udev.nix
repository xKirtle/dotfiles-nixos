{ pkgs, ... }:

{
  services.udev = {
    packages = [ pkgs.solaar ];
    extraRules = ''
      KERNEL=="hidraw*", SUBSYSTEM=="hidraw", MODE="0660", GROUP="input"
    '';
  };
}
