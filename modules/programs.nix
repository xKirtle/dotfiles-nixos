{ ... }:

{
  programs = {
    steam.enable = true;
    git.enable = true;
    gnome-terminal.enable = true;
    fish.enable = true;
  };

  virtualisation.docker.enable = true;
  virtualisation.libvirtd.enable = true;
  programs.virt-manager.enable = true;
  programs.nix-ld.enable = true;
  services.spice-vdagentd.enable = true;
}
