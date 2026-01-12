{ pkgs, ... }:

let
  u = import <nixos-unstable> {
    system = pkgs.stdenv.hostPlatform.system;
    config.allowUnfree = true;
  };
in
{
  home.packages = with pkgs; [
    ArchiSteamFarm
    u.audacity
    (azure-cli.withExtensions [ 
      azure-cli.extensions.aks-preview 
    ])
    brave
    btop-cuda
    calibre
    u.codex
    dconf-editor
    (discord.override {
      withVencord = true;
    })
    docker
    eza
    fastfetch
    file
    foliate
    fragments
    freelens-bin
    gnome-boxes
    go
    gcc
    heroic
    jetbrains.goland
    jetbrains.rider
    libnotify
    u.lsfg-vk
    u.lsfg-vk-ui
    nwg-look
    p7zip
    pavucontrol
    powershell
    proton-pass
    protonup-qt
    protonvpn-gui
    qbittorrent
    r2modman
    sassc
    solaar
    spotify
    starship
    swtpm
    teams-for-linux
    unzip
    vlc
    vscode
    wl-clipboard
    wofi-emoji
    yt-dlp
  ];
}
