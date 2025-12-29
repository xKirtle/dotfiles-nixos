{ pkgs, ... }:

let
  u = import <nixos-unstable> {
    system = pkgs.system;
    config.allowUnfree = true;
  };
in
{
  services.xserver.videoDrivers = [ "nvidia" ];

  hardware.nvidia = {
    open = true;
    modesetting.enable = true;        # Required for Wayland
    nvidiaSettings = true;            # Installs nvidia-settings GUI
    powerManagement.enable = true;    # Helps with Sleep/Resume

    # Pull ONLY the NVIDIA driver from unstable:
    # package = u.linuxPackages.nvidiaPackages.latest;
    package = u.linuxPackages.nvidiaPackages.beta;
  };

  hardware.graphics = {
    enable = true;
    enable32Bit = true; # Needed for Steam/Proton
  };

  environment.variables = {
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
  };
}
