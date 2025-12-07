{ pkgs, ... }:

{
  users.users.beepbopbop = {
    isNormalUser = true;
    description = "username";
    home = "/home/beepbopbop";
    extraGroups = [ "networkmanager" "wheel" "input" ];
    shell = pkgs.fish;
  };
}
