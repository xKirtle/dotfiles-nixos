{ pkgs, ... }:

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
    lsfg-vk
    lsfg-vk-ui
    nwg-look
    pavucontrol
    powershell
    proton-pass
    protonup-qt
    protonvpn-gui
    qbittorrent # can't decide between this and fragments
    sassc
    solaar
    spotify
    starship
    teams-for-linux
    unzip
    vesktop
    vlc
    vscode
    wl-clipboard
    wofi-emoji
    yt-dlp
  ];
}
