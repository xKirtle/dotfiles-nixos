{ pkgs, ... }:

{
  services.xserver.enable = true;
  services.xserver.excludePackages = with pkgs; [
    xterm
  ];

  services.desktopManager.gnome.enable = true;
  services.displayManager = {
    gdm = {
      enable = true;
      wayland = true;
    };
  };

  # Give GNOME a bit more time to complete lock handoff before suspend
  services.logind.settings.Login.InhibitDelayMaxSec = 10;

  # GNOME/NVIDIA resume workaround: pause shell during suspend and continue on resume
  systemd.services.gnome-suspend = {
    description = "Pause gnome-shell before suspend";
    before = [ "systemd-suspend.service" ];
    wantedBy = [ "systemd-suspend.service" ];
    serviceConfig = {
      Type = "oneshot";
      ExecStart = "${pkgs.procps}/bin/pkill -STOP -f gnome-shell";
    };
  };
  systemd.services.gnome-resume = {
    description = "Continue gnome-shell after suspend";
    # Avoid input-loss race: only continue gnome-shell after NVIDIA resume work
    after = [
      "systemd-suspend.service"
      "nvidia-resume.service"
    ];
    wantedBy = [ "systemd-suspend.service" ];
    serviceConfig = {
      Type = "oneshot";
      ExecStart = "${pkgs.procps}/bin/pkill -CONT -f gnome-shell";
    };
  };
  systemd.services.solaar-resume-sync = {
    description = "Resync Solaar device state after suspend";
    after = [
      "systemd-suspend.service"
      "nvidia-resume.service"
      "gnome-resume.service"
    ];
    wantedBy = [ "systemd-suspend.service" ];
    serviceConfig = {
      Type = "oneshot";
      User = "beepbopbop";
      ExecStart = "${pkgs.bash}/bin/bash -lc 'for i in 1 2 3; do ${pkgs.solaar}/bin/solaar show >/dev/null 2>&1 && exit 0; ${pkgs.coreutils}/bin/sleep 1; done; exit 0'";
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

  environment.gnome.excludePackages = with pkgs; [
    gnome-tour
    gnome-console
  ];

  environment.variables = {
    GST_PLUGIN_PATH = "/run/current-system/sw/lib/gstreamer-1.0/";
  };

  xdg.portal = {
    enable = true;
    extraPortals = [ pkgs.xdg-desktop-portal-gnome ];
  };
}
