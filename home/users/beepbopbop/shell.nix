{ ... }:

{
  programs.fish = {
    enable = true;

    shellAliases = {
      ls = "eza -a --icons=always";
    };

    interactiveShellInit = ''
      # Only run fastfetch when interactive (and not inside VSCode terminal or script)
      if status is-interactive; and test -t 1
        fastfetch
      end
    '';
  };

  programs.starship = {
    enable = true;
    settings = {
      add_newline = true;

      format = "$directory$git_branch$git_status$nodejs$rust$golang$python$java$dotnet$line_break$character";

      directory = {
        truncation_length = 3;
        truncation_symbol = "…/";
        style = "white";
        format = "[$path]($style) ";
      };

      git_branch = {
        symbol = " ";
        style = "fg:#5fb3b3";
        format = "[$symbol$branch]($style) ";
      };

      git_status = {
        style = "fg:#5fb3b3";
        format = "[$all_status $ahead_behind]($style) ";
        conflicted = " !";
        stashed    = " ≡";
        modified   = " ~";
        staged     = " +";
        renamed    = " »";
        deleted    = " ✖";
        untracked  = " *";
      };

      nodejs = {
        symbol = " ";
        style = "dimmed white";
        format = "[$symbol]($style) ";
      };

      rust = {
        symbol = " ";
        style = "dimmed white";
        format = "[$symbol]($style) ";
      };

      golang = {
        symbol = " ";
        style = "dimmed white";
        format = "[$symbol]($style) ";
      };

      python = {
        symbol = " ";
        style = "dimmed white";
        format = "[$symbol]($style) ";
      };

      java = {
        symbol = " ";
        style = "dimmed white";
        format = "[$symbol]($style) ";
      };

      dotnet = {
        symbol = " ";
        style = "dimmed white";
        format = "[$symbol]($style) ";
      };

      character = {
        success_symbol = "[❯](fg:#5fb3b3)";
        error_symbol   = "[❯](bold red)";
      };
    };
  };
}
