{ ... }:

{
  programs.fish = {
    enable = true;

    shellAliases = {
      ls = "eza -a --icons=always";
      nix-reload = "sudo nixos-rebuild switch";
    };

    interactiveShellInit = ''
      # Only run fastfetch when interactive (and not inside VSCode terminal or script)
      if status is-interactive; and test -t 1
        fastfetch
      end
    '';

    functions."yt-mp3" = {
      description = "Download audio as mp3 via yt-dlp";
      body = ''
        if test (count $argv) -lt 1
          echo "usage: yt-mp3 <url>"
          return 1
        end
        yt-dlp -t mp3 $argv
      '';
    };

    functions."7z-min" = {
      description = "Create a 7z archive with no compression";
      body = ''
        if test (count $argv) -lt 2
          echo "usage: 7z-min <archive.7z> <paths...>"
          return 1
        end
        set archive $argv[1]
        set targets $argv[2..-1]
        7z a -t7z -mx=0 "$archive" $targets
      '';
    };

    functions."7z-medium" = {
      description = "Create a 7z archive with medium compression";
      body = ''
        if test (count $argv) -lt 2
          echo "usage: 7z-medium <archive.7z> <paths...>"
          return 1
        end
        set archive $argv[1]
        set targets $argv[2..-1]
        7z a -t7z -mx=5 "$archive" $targets
      '';
    };

    functions."7z-max" = {
      description = "Create a 7z archive with maximum compression";
      body = ''
        if test (count $argv) -lt 2
          echo "usage: 7z-max <archive.7z> <paths...>"
          return 1
        end
        set archive $argv[1]
        set targets $argv[2..-1]
        7z a -t7z -m0=lzma2 -mx=9 "$archive" $targets
      '';
    };

    functions."7z-unzip" = {
      description = "Extract any archive supported by 7z";
      body = ''
        if test (count $argv) -lt 1
          echo "usage: 7z-unzip <archive> [destination]"
          return 1
        end

        set archive $argv[1]
        set dest "."
        if test (count $argv) -ge 2
          set dest $argv[2]
          mkdir -p $dest
        end

        7z x "$archive" -o"$dest"
      '';
    };

    functions."nix-cleanup" = {
      description = "Clean up old nix store generations and garbage collect";
      body = ''
        sudo nix-collect-garbage -d
        sudo nix-env --delete-generations old
        sudo nix-store --optimise
      '';
    };
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
