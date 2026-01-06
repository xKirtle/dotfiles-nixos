# dotfiles-nixos

These are my notes and configs for the `beepbopbop` NixOS host. Home Manager handles the user environment, GNOME is the desktop, `system.stateVersion` is 25.11, and a few bits come from `nixos-unstable`. I keep a Colloid teal overlay for GTK/icons.

## Layout
- `configuration.nix` - entry point tying hardware, system, desktop modules, overlays, and Home Manager together.
- `modules/` - system pieces (boot, networking, PipeWire, printing, fonts, users, U2F, NVIDIA, GNOME desktop, programs/virtualisation defaults).
- `home-manager.nix` - turns on Home Manager and points to the user profile below.
- `home/users/beepbopbop/` - Home Manager modules for GTK/Colloid theming, dconf tweaks, Fish + Starship, package list, autostart, SSH/Git/U2F bits, and app configs.
- `overlays/colloid-teal.nix` - builds the Colloid [GTK theme](https://github.com/vinceliuice/Colloid-gtk-theme) and [icon theme](https://github.com/vinceliuice/Colloid-icon-theme) from upstream master with teal tweaks.
- `link-nixos.sh` - symlinks this repo into `/etc/nixos` (backs up the old dir with `--force`) and can set up channels.

## Requirements
- NixOS with `allowUnfree` enabled in `configuration.nix` for proprietary packages (NVIDIA, Steam, etc.).

## Setup
1) Clone to `~/dotfiles-nixos` (or wherever).
2) Symlink into `/etc/nixos`:
   - `--force` backs up an existing `/etc/nixos` to `/etc/nixos.bak.<timestamp>` before linking.
   - `--setup-channels` adds/updates channels (`nixos` defaults to 25.11, plus `nixos-unstable` and `home-manager`) and runs `nix-channel --update`.
   - `--stable-url/--unstable-url/--home-manager-url` override the URLs used by `--setup-channels`.
   ```bash
   cd ~/dotfiles-nixos
   sudo ./link-nixos.sh --force --setup-channels
   ```
3) Build and switch:
   ```bash
   sudo nixos-rebuild switch
   ```

## Highlights (for future me)
- GNOME desktop with xdg-desktop-portal, gnome-keyring, curated extensions, and custom keybindings.
- NVIDIA pulls the beta driver from `nixos-unstable`; 32-bit graphics enabled for gaming; nvidia-settings installed.
- PipeWire + WirePlumber with profile restore for the Focusrite Scarlett Solo.
- Virtualisation: Docker, libvirtd, virt-manager, SPICE agent; Steam and gaming bits on.
- Fonts/themes: JetBrains Mono + Nerd Font, Colloid teal [GTK](https://github.com/vinceliuice/Colloid-gtk-theme)/[icons](https://github.com/vinceliuice/Colloid-icon-theme), Bibata cursor; overlay builds from upstream.
- Home Manager: Fish aliases/functions (`nix-update*`, `nix-cleanup`, `yt-mp3`, 7z helpers), Starship prompt, big package set, autostart (Vesktop, Steam silent, Solaar), xdg user dirs, fastfetch config.
- Security: PAM U2F for sudo (with password fallback), SSH config per host, allowed signers for SSH-signed Git commits.

## Notes
- SSH keys live under `home/users/beepbopbop/files/ssh/secrets/` (e.g., `ssh/secrets/my_ed25519_key` and `ssh/secrets/my_ed25519_key.pub`); keep `files/ssh/allowed_signers` tracked, but swap in your own secret keys.
- Replace the U2F mappings under `home/users/beepbopbop/files/u2f/` with your own.
- When channels update, run `sudo nixos-rebuild switch` (Fish functions `nix-update*` help).
