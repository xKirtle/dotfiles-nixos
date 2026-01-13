{ pkgs, ... }:

let
  nasUri = "smb://nas.local/personal_folder";
in
{
  services.gnome-keyring.enable = true;

  systemd.user.services.mount-ugreen-smb = {
    Unit = {
      Description = "Auto-mount Ugreen NAS SMB via GVFS (gio mount)";
      After = [ "graphical-session.target" ];
      Wants = [ "graphical-session.target" ];
    };

    Service = {
      Type = "oneshot";
      ExecStart = "${pkgs.bash}/bin/bash -lc '${pkgs.glib}/bin/gio mount \"${nasUri}\"; rc=$?; [ $rc -eq 0 -o $rc -eq 2 ]'";
      ExecStop  = "${pkgs.glib}/bin/gio mount -u \"${nasUri}\"";
      RemainAfterExit = true;
    };

    Install = {
      WantedBy = [ "graphical-session.target" ];
    };
  };
}
