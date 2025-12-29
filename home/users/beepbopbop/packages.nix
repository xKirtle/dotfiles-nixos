{ pkgs, ... }:

let
  u = import <nixos-unstable> {
    system = pkgs.system;
    config.allowUnfree = true;
  };
in
{
  home.packages = with pkgs; [
    p7zip
    audacity
    azure-cli
    brave
    calibre
    codex
    dconf-editor
    docker
    dotnetCorePackages.sdk_10_0-bin
    eza
    fastfetch
    file
    foliate
    fragments
    freelens-bin
    go
    gcc
    heroic
    jetbrains.goland
    jetbrains.rider
    libnotify
    nwg-look
    pavucontrol
    powershell
    proton-pass
    protonup-qt
    protonvpn-gui
    qbittorrent
    sassc
    solaar
    spotify
    starship
    teams-for-linux
    unzip
    vlc
    vscode
    wl-clipboard
    wofi-emoji
    yt-dlp

    # unstable
    u.lsfg-vk
    u.lsfg-vk-ui
    u.vesktop
  ];
}
