{ config, pkgs, lib, ... }:

{
  home.username = "beepbopbop";
  home.homeDirectory = "/home/beepbopbop";
  home.stateVersion = "25.11";

  imports = [
    ./gtk.nix
    ./dconf.nix
    ./shell.nix
    ./packages.nix
    ./xdg.nix
    ./autostart.nix
    ./fastfetch.nix
    ./configFiles.nix
    ./ssh.nix
    ./git.nix
    ./u2f.nix
  ];
}
