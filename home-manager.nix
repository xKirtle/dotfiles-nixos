{ ... }:

{
  # Ensure Home Manager uses the system pkgs set (with overlays) so custom packages resolve.
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  # Backup any existing user-managed files instead of failing on collision.
  home-manager.backupFileExtension = "bak";

  home-manager.users.beepbopbop = import ./home/users/beepbopbop;
}
