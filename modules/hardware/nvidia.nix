{ pkgs, ... }:

let
  u = import <nixos-unstable> {
    system = pkgs.stdenv.hostPlatform.system;
    config.allowUnfree = true;
  };
in
{
  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    open = true;
    gsp.enable = true;
    modesetting.enable = true;        # Required for Wayland
    nvidiaSettings = true;            # Installs nvidia-settings GUI
    powerManagement.enable = true;    # Enables nvidia-{suspend,resume,hibernate} units

    # Keep on the latest branch for RTX 5080 support.
    package = u.linuxPackages.nvidiaPackages.latest;
  };

  # Preserve VRAM snapshots under /var/tmp during suspend/hibernate.
  # NixOS already sets NVreg_PreserveVideoMemoryAllocations=1 when
  # hardware.nvidia.powerManagement.enable = true.
  boot.extraModprobeConfig = ''
    options nvidia NVreg_TemporaryFilePath=/var/tmp
  '';

  hardware.graphics = {
    enable = true;
    enable32Bit = true; # Needed for Steam/Proton
  };

  environment.variables = {
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
  };
}
