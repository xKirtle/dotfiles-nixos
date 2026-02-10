{ ... }:

{
  home.file.".config/solaar/config.yaml".source = ./files/solaar/config.yaml;
  home.file.".config/teams-for-linux/config.json".source = ./files/teams-for-linux/config.json;
  home.file.".config/gtk-3.0/bookmarks".source = ./files/gtk-3.0/bookmarks;
  home.file.".config/gtk-3.0/bookmarks".force = true;
  xdg.configFile."fastfetch/config.jsonc".source = ./files/fastfetch/config.jsonc;
  xdg.configFile."fastfetch/ascii/arch.txt".source = ./files/fastfetch/ascii/arch.txt;
  xdg.configFile."fastfetch/logos/NixOS.png".source = ./files/fastfetch/logos/NixOS.png;
}
