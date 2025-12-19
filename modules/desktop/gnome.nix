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

    gst_all_1.gstreamer
    gst_all_1.gst-plugins-base
    gst_all_1.gst-plugins-good
    gst_all_1.gst-plugins-bad
    gst_all_1.gst-plugins-ugly
    gst_all_1.gst-libav
    gst_all_1.gst-vaapi
  ];

  environment.variables = {
    GST_PLUGIN_PATH = "/run/current-system/sw/lib/gstreamer-1.0/";
  };

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gnome ];
  };
}
