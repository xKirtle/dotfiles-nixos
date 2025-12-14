{ pkgs, ... }:

{
  services.xserver.enable = true;
  services.desktopManager.gnome.enable = true;
  services.displayManager = {
    gdm = {
      enable = true;
      wayland = true;
    };
  };

  services.gnome.gnome-keyring.enable = true;
  programs.dconf.enable = true;

  environment.systemPackages = with pkgs; [
    gnome-tweaks
    gnomeExtensions.appindicator
    gnomeExtensions.dash-to-dock
    gnomeExtensions.pop-shell
    gnomeExtensions.clipboard-indicator
  ];

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gnome ];
  };
}
