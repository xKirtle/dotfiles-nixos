#!/usr/bin/env bash
# Create /etc/nixos -> ~/dotfiles-nixos symlink so system uses repo directly.

set -euo pipefail

TARGET="/etc/nixos"
REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
FORCE=0

usage() {
  cat <<EOF
Usage: sudo $0 [--force]

Creates a symlink from /etc/nixos to this repository (defaults to ~/dotfiles-nixos).

Options:
  --force   Backup an existing /etc/nixos to /etc/nixos.bak.<timestamp> before linking.
  -h, --help  Show this help.
EOF
}

while [[ $# -gt 0 ]]; do
  case "$1" in
    --force) FORCE=1 ;;
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

echo "Linking $TARGET -> $REPO_DIR"
ln -s "$REPO_DIR" "$TARGET"
echo "Done."
