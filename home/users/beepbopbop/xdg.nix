{ ... }:

{
  xdg.userDirs = {
    enable = true;
    createDirectories = true;

    desktop     = "$HOME";
    publicShare = "$HOME";
    templates   = "$HOME";

    documents = "$HOME/Documents";
    download  = "$HOME/Downloads";
    music     = "$HOME/Music";
    pictures  = "$HOME/Pictures";
    videos    = "$HOME/Videos";
  };

  xdg.autostart.enable = true;
}
