{ pkgs, ... }:

{
  gtk = {
    enable = true;

    theme = {
      name = "Colloid-Teal-Light";
      package = pkgs.colloid-gtk-theme-teal;
    };

    iconTheme = {
      name = "Colloid-Teal";
      package = pkgs.colloid-icon-theme-teal;
    };

    cursorTheme = {
      name = "Bibata-Modern-Ice";
      package = pkgs.bibata-cursors;
    };
  };

  # Ensure cursor theme is applied to both Wayland and X11 (Xwayland) apps.
  home.pointerCursor = {
    name = "Bibata-Modern-Ice";
    package = pkgs.bibata-cursors;
    size = 24;
    gtk.enable = true;
    x11.enable = true;
  };
}
