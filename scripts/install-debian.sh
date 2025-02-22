#!/usr/bin/env bash
# install-debian.sh
# This script lists available packages and allows the user to install all or select specific packages.
# APT packages: alacritty, zsh, zoxide, fzf, tmux, fastfetch, nala, neovim, curl
# Optionally, it installs oh‑my‑zsh (which uses curl).

set -e

# List of available APT packages
PACKAGES=(alacritty zsh zoxide fzf tmux fastfetch nala neovim curl)

echo "Available packages to install via apt:"
for pkg in "${PACKAGES[@]}"; do
  echo " - $pkg"
done

echo ""
read -p "Do you want to install all packages? (y/n): " choice

if [[ "$choice" =~ ^[Yy]$ ]]; then
  INSTALL_PACKAGES=("${PACKAGES[@]}")
else
  echo "Enter the names of the packages you want to install, separated by spaces:"
  read -r -a INSTALL_PACKAGES
fi

echo ""
echo "The following packages will be installed via apt: ${INSTALL_PACKAGES[*]}"
read -p "Proceed with installation? (y/n): " confirm

if [[ "$confirm" =~ ^[Yy]$ ]]; then
  echo "Updating package list..."
  sudo apt update
  echo "Installing packages..."
  sudo apt install -y "${INSTALL_PACKAGES[@]}"
  echo "APT installation complete."
else
  echo "APT installation aborted."
  exit 1
fi

echo ""
read -p "Do you want to install oh-my-zsh? (y/n): " omz_choice

if [[ "$omz_choice" =~ ^[Yy]$ ]]; then
  # Since we already ensured curl is installed, run the oh-my-zsh install script:
  echo "Installing oh-my-zsh..."
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else
  echo "Skipping oh-my-zsh installation."
fi
