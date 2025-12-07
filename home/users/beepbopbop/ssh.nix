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

  home.file.".ssh/github_xkirtle_ed25519".source = secrets/ssh/github_xkirtle_ed25519;
  home.file.".ssh/github_xkirtle_ed25519.pub".source = secrets/ssh/github_xkirtle_ed25519.pub;
  home.file.".ssh/gpg/github_xkirtle.asc".source = secrets/ssh/gpg/github_xkirtle.asc;
  home.file.".ssh/gpg/github_xkirtle.pgp".source = secrets/ssh/gpg/github_xkirtle.pgp;
}
