{ config, pkgs, lib, ... }:

{
  home.username = "beepbopbop";
  home.homeDirectory = "/home/beepbopbop";
  home.stateVersion = "25.11";

  imports = [
    ./autostart.nix
    ./configFiles.nix
    ./dconf.nix
    ./dotnet.nix
    ./fastfetch.nix
    ./git.nix
    ./gtk.nix
    ./packages.nix
    ./shell.nix
    ./ssh.nix
    ./u2f.nix
    ./xdg.nix
  ];
}
