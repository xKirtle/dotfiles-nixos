{ pkgs, ... }:

{
  home.packages = with pkgs; [
    audacity
    azure-cli
    brave
    dconf-editor
    docker
    eza
    fastfetch
    freelens-bin
    go
    jetbrains-toolbox
    libnotify
    nwg-look
    pavucontrol
    powershell
    proton-pass
    protontricks
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
