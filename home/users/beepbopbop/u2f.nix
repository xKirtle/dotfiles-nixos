{ ... }:

{
  # Ship Yubico U2F mappings into the user config so pam_u2f can find them.
  home.file.".config/Yubico/u2f_keys".source = ./files/u2f/u2f_keys;
}
