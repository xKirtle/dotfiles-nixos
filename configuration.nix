{ ... }:

{
  nixpkgs = {
    overlays = [
      (import ./overlays/colloid-teal.nix)
    ];
    config.allowUnfree = true;
  };

  imports = [
    ./hardware-configuration.nix
    ./modules/hardware/nvidia.nix
    ./modules/system/audio.nix
    ./modules/system/boot.nix
    ./modules/system/fonts.nix
    ./modules/system/localisation.nix
    ./modules/system/networking.nix
    ./modules/system/printing.nix
    ./modules/system/u2f.nix
    ./modules/system/udev.nix
    ./modules/system/users.nix
    ./modules/programs.nix
    ./modules/desktop/gnome.nix
    <home-manager/nixos>
    ./home-manager.nix
  ];

  system.stateVersion = "25.11";

  nixpkgs.config.permittedInsecurePackages = [
  ];
}
