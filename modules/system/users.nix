{ pkgs, ... }:

{
  users.users.beepbopbop = {
    isNormalUser = true;
    description = "username";
    home = "/home/beepbopbop";
    extraGroups = [ "networkmanager" "wheel" "input" "docker" ];
    shell = pkgs.fish;
  };
}
