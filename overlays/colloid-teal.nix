self: super:

{
  colloid-gtk-theme-teal = super.colloid-gtk-theme.overrideAttrs (old: {
    pname = "colloid-gtk-theme-teal";
    version = "latest";

    src = super.fetchFromGitHub {
      owner = "vinceliuice";
      repo = "Colloid-gtk-theme";
      rev = "master";
      sha256 = "sha256-3PCDrZ+7PQGi4n/3XY1ikeOjbYgZ1+anihZm9raW3CM=";
    };

    installPhase = ''
      # Theme install script writes libadwaita assets into $HOME/.config/gtk-4.0; point it to a writable temp dir.
      export HOME="$TMPDIR/home"
      export XDG_CONFIG_HOME="$HOME/.config"
      mkdir -p "$XDG_CONFIG_HOME"

      bash install.sh \
        --theme teal \
        --tweaks rimless \
        --size standard \
        --name Colloid \
        --dest $out/share/themes \
        --libadwaita

      # Keep generated libadwaita files alongside the theme for consumers to symlink if desired.
      if [ -d "$XDG_CONFIG_HOME/gtk-4.0" ]; then
        for themeDir in Colloid-Teal-Light Colloid-Teal-Dark; do
          mkdir -p "$out/share/themes/$themeDir"
          cp -r "$XDG_CONFIG_HOME/gtk-4.0" "$out/share/themes/$themeDir/"
        done
      fi
    '';
  });

  colloid-icon-theme-teal = super.colloid-icon-theme.overrideAttrs (old: {
    pname = "colloid-icon-theme-teal";
    version = "latest";

    src = super.fetchFromGitHub {
      owner = "vinceliuice";
      repo = "Colloid-icon-theme";
      rev = "master";
      sha256 = "sha256-FZ3WUAQH80eteUO/+MJUuwEN8D43pQ8qrq+XBz2TiXM=";
    };

    dontCheckForBrokenSymlinks = true;

    installPhase = ''
      bash install.sh \
        --theme teal \
        --name Colloid \
        --dest $out/share/icons
    '';
  });
}
