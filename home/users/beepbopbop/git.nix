{ ... }:

{
  programs.git = {
    enable = true;
    settings = {
      gpg.format = "ssh";
      gpg.ssh.allowedSignersFile = "~/.ssh/allowed_signers";
    };

    # Default identity can stay empty; includeIf blocks below set per-directory identities.
    includes = [
      {
        condition = "gitdir:~/Dev/Personal/";
        contents = {
          user = {
            name = "xKirtle";
            email = "rodm.martins@proton.me";
            signingkey = "~/.ssh/github_xkirtle_ed25519.pub";
          };
          commit.gpgSign = true;
        };
      }
      {
        condition = "gitdir:~/Dev/Work/";
        contents = {
          user = {
            name = "Rodrigo Martins";
            email = "rodrigo.martins@unit4.com";
            # signingkey = "~/.ssh/github_xkirtle_ed25519.pub";
          };
          commit.gpgSign = false;
        };
      }
    ];
  };

  # Allow SSH-based signatures to verify locally; edit files/ssh/allowed_signers to add more keys.
  home.file.".ssh/allowed_signers".source = ./files/ssh/allowed_signers;
}
