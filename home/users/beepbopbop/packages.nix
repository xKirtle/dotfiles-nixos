{ pkgs, ... }:

{
  home.packages = with pkgs; [
    audacity
    azure-cli
    brave
    dconf-editor
    docker
    dotnetCorePackages.sdk_10_0-bin
    eza
    fastfetch
    freelens-bin
    go
    jetbrains.goland
    jetbrains.rider
    libnotify
    nwg-look
    pavucontrol
    powershell
    proton-pass
    protonup-qt
    protonvpn-gui
    sassc
    solaar
    starship
    spotify
    unzip
    vesktop
    vlc
    vscode
    wl-clipboard
    wofi-emoji
  ];
}
