{ ... }:

{
  programs.ssh = {
    enable = true;

    matchBlocks = {
      "github.com" = {
        user = "git";
        hostname = "github.com";
        identityFile = "~/.ssh/github_xkirtle_ed25519";
        identitiesOnly = true;
      };
    };
  };

  home.file.".ssh/github_xkirtle_ed25519".source = ./files/ssh/secrets/github_xkirtle_ed25519;
  home.file.".ssh/github_xkirtle_ed25519.pub".source = ./files/ssh/secrets/github_xkirtle_ed25519.pub;
}
