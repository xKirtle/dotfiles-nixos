#!/usr/bin/env bash
# Create /etc/nixos -> ~/dotfiles-nixos symlink so the system uses this repo directly.
# Optional: add/update recommended nix channels before linking.

set -euo pipefail

TARGET="/etc/nixos"
REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
FORCE=0
SETUP_CHANNELS=0
STABLE_CHANNEL_URL="https://nixos.org/channels/nixos-25.11"
UNSTABLE_CHANNEL_URL="https://nixos.org/channels/nixos-unstable"
HM_CHANNEL_URL="https://github.com/nix-community/home-manager/archive/master.tar.gz"

usage() {
  cat <<EOF
Usage: sudo $0 [--force] [--setup-channels] [--stable-url URL] [--unstable-url URL] [--home-manager-url URL]

Creates a symlink from /etc/nixos to this repository (defaults to ~/dotfiles-nixos).

Options:
  --force              Backup an existing /etc/nixos to /etc/nixos.bak.<timestamp> before linking.
  --setup-channels     Add/update nixos, nixos-unstable, and home-manager channels, then run nix-channel --update.
  --stable-url URL     Override the stable channel URL (default: $STABLE_CHANNEL_URL).
  --unstable-url URL   Override the unstable channel URL (default: $UNSTABLE_CHANNEL_URL).
  --home-manager-url URL  Override the Home Manager channel URL (default: $HM_CHANNEL_URL).
  -h, --help           Show this help.
EOF
}

ensure_channel() {
  local name="$1"
  local url="$2"
  local current

  current="$(nix-channel --list | awk -v name="$name" '$1 == name { print $2; exit }')" || true

  if [[ -n "$current" ]]; then
    if [[ "$current" == "$url" ]]; then
      echo "Channel '$name' already set to $url"
      return
    else
      echo "Updating channel '$name' -> $url (was $current)"
    fi
  else
    echo "Adding channel '$name' -> $url"
  fi

  nix-channel --add "$url" "$name"
}

setup_channels() {
  echo "Configuring nix channels..."
  ensure_channel "nixos" "$STABLE_CHANNEL_URL"
  ensure_channel "nixos-unstable" "$UNSTABLE_CHANNEL_URL"
  ensure_channel "home-manager" "$HM_CHANNEL_URL"
  echo "Updating channels..."
  nix-channel --update
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --force) FORCE=1 ;;
    --setup-channels) SETUP_CHANNELS=1 ;;
    --stable-url)
      [[ $# -ge 2 ]] || { echo "Missing value for --stable-url" >&2; exit 1; }
      STABLE_CHANNEL_URL="$2"; shift ;;
    --unstable-url)
      [[ $# -ge 2 ]] || { echo "Missing value for --unstable-url" >&2; exit 1; }
      UNSTABLE_CHANNEL_URL="$2"; shift ;;
    --home-manager-url)
      [[ $# -ge 2 ]] || { echo "Missing value for --home-manager-url" >&2; exit 1; }
      HM_CHANNEL_URL="$2"; shift ;;
    -h|--help) usage; exit 0 ;;
    *) echo "Unknown option: $1" >&2; usage; exit 1 ;;
  esac
  shift
done

if [[ "$(id -u)" -ne 0 ]]; then
  echo "Please run as root (e.g., sudo $0)." >&2
  exit 1
fi

if [[ -L "$TARGET" ]]; then
  current="$(readlink -f "$TARGET")"
  if [[ "$current" == "$REPO_DIR" ]]; then
    echo "$TARGET already points to $REPO_DIR"
    exit 0
  elif [[ "$FORCE" -eq 1 ]]; then
    rm "$TARGET"
  else
    echo "$TARGET is a symlink to $current; rerun with --force to replace." >&2
    exit 1
  fi
fi

if [[ -e "$TARGET" ]]; then
  if [[ "$FORCE" -eq 1 ]]; then
    backup="${TARGET}.bak.$(date +%s)"
    echo "Backing up existing $TARGET to $backup"
    mv "$TARGET" "$backup"
  else
    echo "$TARGET exists; rerun with --force to back it up and replace." >&2
    exit 1
  fi
fi

if [[ "$SETUP_CHANNELS" -eq 1 ]]; then
  setup_channels
fi

echo "Linking $TARGET -> $REPO_DIR"
ln -s "$REPO_DIR" "$TARGET"
echo "Done."
