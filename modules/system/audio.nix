{ ... }:

{
  services.pulseaudio.enable = false;
  security.rtkit.enable = true;

  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    
    wireplumber.enable = true;

    # Couldn't make wireplumber select the right profile for my Focusrite Scarlett Solo, so I did the next best thing: force it to remember the profile I set manually.
    wireplumber.extraConfig."10-enable-profile-restore" = {
      "wireplumber.settings" = {
        "device.restore-profile" = true;
      };
    };

    # Does not work
    # wireplumber.extraConfig."50-scarlett-solo-profile" = {
    #   "monitor.alsa.rules" = [
    #     {
    #       matches = [
    #         { "device.name" = "alsa_card.usb-Focusrite_Scarlett_Solo_4th_Gen_S14AD9G3B27480-00"; }
    #       ];
    #       actions = {
    #         update-props = {
    #           "device.profile" = "HiFi (Line1, Line2, Mic1, Mic2)";
    #         };
    #       };
    #     }
    #   ];
    # };
  };
}
