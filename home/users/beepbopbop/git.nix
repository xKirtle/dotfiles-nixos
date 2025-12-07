{ ... }:

{
  programs.git = {
    enable = true;

    # Default identity can stay empty; includeIf blocks below set per-directory identities.
    includes = [
      {
        condition = "gitdir:~/Dev/Personal/";
        contents = {
          user = {
            name = "xKirtle";
            email = "rodm.martins@proton.me";
            signingkey = "8ECF2A4CCAC44B13";
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
            signingkey = "47787D3E30F2D9C9";
          };
          commit.gpgSign = true;
        };
      }
    ];
  };
}
