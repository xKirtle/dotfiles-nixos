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
}
