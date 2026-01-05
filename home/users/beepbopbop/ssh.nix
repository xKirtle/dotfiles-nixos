{ ... }:

{
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;

    matchBlocks = {
      "github.com" = {
        user = "git";
        hostname = "github.com";
        identityFile = "~/.ssh/github_xkirtle_ed25519";
        identitiesOnly = true;
      };
      "ssh.dev.azure.com" = {
        user = "git";
        hostname = "ssh.dev.azure.com";
        identityFile = "~/.ssh/azure_unit4_rsa";
        identitiesOnly = true;
      };
    };
  };

  home.file.".ssh/github_xkirtle_ed25519".source = ./files/ssh/secrets/github_xkirtle_ed25519;
  home.file.".ssh/github_xkirtle_ed25519.pub".source = ./files/ssh/secrets/github_xkirtle_ed25519.pub;
  home.file.".ssh/azure_unit4_rsa".source = ./files/ssh/secrets/azure_unit4_rsa;
  home.file.".ssh/azure_unit4_rsa.pub".source = ./files/ssh/secrets/azure_unit4_rsa.pub;
}
