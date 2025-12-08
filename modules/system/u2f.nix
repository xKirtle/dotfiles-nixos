{ config, pkgs, lib, ... }:

{
  # Install pam_u2f and make it available for PAM services.
  security.pam.u2f = {
    enable = true;
    control = "sufficient";
    settings = {
      cue = true;
      interactive = false;
    };
  };

  # Require U2F for sudo, falling back to the normal password prompt if the key is unavailable.
  security.pam.services.sudo.u2fAuth = true;

  # Do not prompt for U2F at graphical or tty login.
  security.pam.services.login.u2fAuth = false;
  security.pam.services.gdm-password.u2fAuth = false;
}
