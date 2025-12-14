{ ... }:

{
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  boot.loader.systemd-boot.extraEntries."windows.conf" = ''
    title Windows 11
    efi /EFI/Microsoft/Boot/bootmgfw.efi
  '';
}
