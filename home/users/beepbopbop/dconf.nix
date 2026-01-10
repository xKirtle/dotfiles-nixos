{ ... }:

{
    dconf.settings = {
      "org/gnome/desktop/interface" = {
        gtk-theme = "Colloid-Teal-Light";
        gtk-theme-dark = "Colloid-Teal-Dark";
        icon-theme = "Colloid-Teal";
        cursor-theme = "Bibata-Modern-Ice";
        color-scheme = "prefer-dark";
      };

      "org/gnome/desktop/wm/keybindings" = {
        activate-window-menu = ["disabled"];
        begin-move = ["disabled"];
        begin-resize = ["disabled"];
        close = ["<Super>q"];
        cycle-group = ["disabled"];
        cycle-group-backward = ["disabled"];
        cycle-panels = ["disabled"];
        cycle-panels-backward = ["disabled"];
        cycle-windows = ["disabled"];
        cycle-windows-backward = ["disabled"];
        maximize = ["disabled"];
        minimize = ["disabled"];
        move-to-monitor-down = ["disabled"];
        move-to-monitor-left = ["<Shift><Super>Left"];
        move-to-monitor-right = ["<Shift><Super>Right"];
        move-to-monitor-up = ["disabled"];
        move-to-workspace-1 = ["<Shift><Super>1"];
        move-to-workspace-2 = ["<Shift><Super>2"];
        move-to-workspace-3 = ["<Shift><Super>3"];
        move-to-workspace-4 = ["<Shift><Super>4"];
        move-to-workspace-last = ["disabled"];
        move-to-workspace-left = ["disabled"];
        move-to-workspace-right = ["disabled"];
        panel-run-dialog = ["disabled"];
        switch-applications = ["disabled"];
        switch-applications-backward = ["disabled"];
        switch-group = ["disabled"];
        switch-group-backward = ["disabled"];
        switch-to-workspace-1 = ["<Super>1"];
        switch-to-workspace-2 = ["<Super>2"];
        switch-to-workspace-3 = ["<Super>3"];
        switch-to-workspace-4 = ["<Super>4"];
        switch-to-workspace-last = ["disabled"];
        switch-to-workspace-left = ["<Super><Shift>Tab"];
        switch-to-workspace-right = ["<Super>Tab"];
        switch-windows = ["<Alt>Tab"];
        switch-windows-backward = ["<Shift><Alt>Tab"];
        switch-input-source = ["<Alt>Shift_L"];
        switch-input-source-backward = ["disabled"];
        toggle-fullscreen = ["<Super>f"];
        toggle-maximized = ["<Super>m"];
        unmaximize = ["disabled"];
      };

      "org/gnome/mutter/wayland/keybindings" = {
        restore-shortcuts = ["disabled"];
      };

      "org/gnome/settings-daemon/plugins/media-keys" = {
        control-center = ["<Shift><Super>s"];
        custom-keybindings = [
          "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
        ];
        home = ["<Super>e"];
        logout = ["disabled"];
        magnifier = ["disabled"];
        magnifier-zoom-in = ["disabled"];
        magnifier-zoom-out = ["disabled"];
        mic-mute = ["<Super>AudioMute"];
        next = ["AudioNext"];
        play = ["AudioPlay"];
        previous = ["AudioPrev"];
        screenreader = ["disabled"];
        shutdown = ["disabled"];
        volume-down = ["AudioLowerVolume"];
        volume-mute = ["AudioMute"];
        volume-up = ["AudioRaiseVolume"];
        www = ["<Super>b"];
      };

      "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
        binding = "<Super>Return";
        command = "gnome-terminal";
        name = "Open Terminal";
      };

      "org/gnome/shell/keybindings" = {
        focus-active-notification = ["disabled"];
        screenshot = ["disabled"];
        screenshot-window = ["<Control>Print"];
        show-screen-recording-ui = ["disabled"];
        switch-to-application-1 = ["disabled"];
        switch-to-application-2 = ["disabled"];
        switch-to-application-3 = ["disabled"];
        switch-to-application-4 = ["disabled"];
        toggle-application-view = ["disabled"];
        toggle-message-tray = ["<Super>n"];
        toggle-quick-settings = ["disabled"];
      };

      "org/gnome/shell" = {
        disabled-extensions = [
          "dash-to-dock@micxgx.gmail.com"
          "night-light-toggle@egoistpizza.github.com"
          "pop-shell@system76.com"
        ];
        enabled-extensions = [
          "clipboard-indicator@tudmotu.com"
          "appindicatorsupport@rgcjonas.gmail.com"
          "set-notification-position@brgvos"
          "user-theme@gnome-shell-extensions.gcampax.github.com"
          "system-monitor@gnome-shell-extensions.gcampax.github.com"
          "pip-on-top@rafostar.github.com"
          "do-not-disturb-while-screen-sharing-or-recording@marcinjahn.com"
          "grand-theft-focus@zalckos.github.com"
          "emoji-copy@felipeftn"
          "solaar-extension@sidevesh"
          "tiling-assistant@leleat-on-github"
          "proton-vpn@fthx"
          "draw-on-gnome@daveprowse.github.io"
          "no-overview@fthx"
          "nightthemeswitcher@romainvigier.fr"
          "audio-switch-shortcuts@dbatis.github.com"
          "status-area-horizontal-spacing@mathematical.coffee.gmail.com"
          "tweaks-system-menu@extensions.gnome-shell.fifi.org"
        ];
        favorite-apps=[
          "brave-browser.desktop"
          "org.gnome.Nautilus.desktop"
          "discord.desktop"
          "steam.desktop"
          "spotify.desktop"
          "code.desktop"
          "org.gnome.Geary.desktop"
        ];
        last-selected-power-profile = "performance";
        welcome-dialog-last-shown-version = "49.2";
      };

      "org/gnome/shell/extensions/appindicator" = {
        icon-brightness = 0;
        icon-contrast = 0;
        icon-opacity = 240;
        icon-saturation = 0;
        icon-size = 24;
      };

      "org/gnome/shell/extensions/clipboard-indicator" = {
        clear-history = ["disabled"];
        enable-keybindings = true;
        next-entry = ["disabled"];
        prev-entry = ["disabled"];
        private-mode-binding = ["disabled"];
        toggle-menu = ["<Super>v"];
      };

      "org/gnome/shell/extensions/do-not-disturb-while-screen-sharing-or-recording" = {
        is-wayland = true;
      };

      "org/gnome/shell/extensions/emoji-copy" = {
        always-show = true;
        emoji-keybind = ["<Super><Shift>V"];
      };

      "org/gnome/shell/extensions/set-notification-position" = {
        change-banner-position = 2;
      };

      "org/gnome/shell/extensions/tiling-assistant" = {
        activate-layout0 = ["disabled"];
        activate-layout1 = ["disabled"];
        activate-layout2 = ["disabled"];
        activate-layout3 = ["disabled"];
        auto-tile = ["disabled"];
        center-window = ["disabled"];
        debugging-free-rects = ["disabled"];
        debugging-show-tiled-rects = ["disabled"];
        default-move-mode = 0;
        dynamic-keybinding-behavior = 0;
        enable-tiling-popup = false;
        focus-hint = 0;
        focus-hint-color = "rgb(33,144,164)";
        import-layout-examples = false;
        last-version-installed = 53;

        overridden-settings = "{ 
          'org.gnome.mutter.edge-tiling': <true>, 
          'org.gnome.mutter.keybindings.toggle-tiled-right': <@mb nothing> 
        }";

        restore-window = ["disabled"];
        search-popup-layout = ["disabled"];
        tile-bottom-half = [ "<Control><Super>Down" ];
        tile-bottom-half-ignore-ta = ["disabled"];
        tile-bottomleft-quarter = ["disabled"];
        tile-bottomleft-quarter-ignore-ta = ["disabled"];
        tile-bottomright-quarter = ["disabled"];
        tile-bottomright-quarter-ignore-ta = ["disabled"];
        tile-edit-mode = ["disabled"];
        tile-left-half = [ "<Control><Super>Left" ];
        tile-left-half-ignore-ta = ["disabled"];
        tile-maximize = ["disabled"];
        tile-maximize-horizontally = ["disabled"];
        tile-maximize-vertically = ["disabled"];
        tile-right-half = [ "<Control><Super>Right" ];
        tile-right-half-ignore-ta = ["disabled"];
        tile-top-half = [ "<Control><Super>Up" ];
        tile-top-half-ignore-ta = ["disabled"];
        tile-topleft-quarter = ["disabled"];
        tile-topleft-quarter-ignore-ta = ["disabled"];
        tile-topright-quarter = ["disabled"];
        tile-topright-quarter-ignore-ta = ["disabled"];
        toggle-always-on-top = ["disabled"];
        toggle-tiling-popup = ["disabled"];
      };

      "org/gnome/shell/extensions/nightthemeswitcher/time" = {
        manual-schedule = true;
        nightthemeswitcher-ondemand-keybinding = "[<Shift><Super>t]";
        sunrise = 10.0;
        sunset = 18.0;
      };

      "org/gnome/shell/extensions/audio-switch-shortcuts" = {
        # Remove audio-devices prop to reset to automatic detection
        audio-devices = ''[
          {"id":19,"name":"Digital Output (S/PDIF) - Family 17h/19h/1ah HD Audio Controller","type":"OUTPUT","cycled":true,"active":true},
          {"id":5,"name":"Direct Scarlett Solo 4th Gen - Scarlett Solo 4th Gen","type":"OUTPUT","cycled":true,"active":true}
        ]'';
        cycle-input-hotkey = ["disabled"];
        cycle-output-hotkey = ["<Super>Escape"];
        show-volume-osd = false;
      };

      "org/gnome/shell/extensions/status-area-horizontal-spacing" = {
        hpadding = 6;
      };

      "org/gtk/gtk4/settings/file-chooser" = {
        show-hidden = true;
      };

      "org/gnome/terminal/legacy/keybindings" = {
        close-tab = ["<Primary>q"];
        detach-tab = ["<Primary><Shift>t"];
        find = ["<Primary>f"];
        find-clear = ["disabled"];
        find-next = ["disabled"];
        find-previous = ["disabled"];
        move-tab-left = ["disabled"];
        move-tab-right = ["disabled"];
        new-tab = ["<Primary>t"];
        new-window = ["<Primary><Shift>n"];
        next-tab = ["<Alt>bracketright"];
        preferences = ["<Primary><Alt>s"];
        prev-tab = ["<Alt>bracketleft"];
      };

      "org/gnome/terminal/legacy/profiles:" = {
        default = "b1dcc9dd-5262-4d8d-a863-c897e6d979b9";
        list = [
          "b1dcc9dd-5262-4d8d-a863-c897e6d979b9"
        ];
      };

      "org/gnome/terminal/legacy/profiles:/:b1dcc9dd-5262-4d8d-a863-c897e6d979b9" = {
        audible-bell = true;
        background-color = "rgb(255,255,255)";
        default-size-columns = 120;
        default-size-rows = 35;
        font = "JetBrainsMono Nerd Font 14";
        foreground-color = "rgb(23,20,33)";
        login-shell = false;
        use-theme-colors = true;
        visible-name = "Default";
      };
    };
}
