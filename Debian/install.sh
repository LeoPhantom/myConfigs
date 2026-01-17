#!/usr/bin/env bash
set -e

echo "▶ Installing i3 Nord theme dependencies..."

PACKAGES=(
  curl
  git
  i3
  i3-wm
  xorg
  xinit
  polybar
  picom
  feh
  alacritty
  dmenu
  fonts-hack-ttf
)

MISSING_PKGS=()

for pkg in "${PACKAGES[@]}"; do
  if ! dpkg -s "$pkg" >/dev/null 2>&1; then
    MISSING_PKGS+=("$pkg")
  else
    echo "✔ $pkg already installed"
  fi
done

if [ "${#MISSING_PKGS[@]}" -gt 0 ]; then
  echo "▶ Installing missing packages: ${MISSING_PKGS[*]}"
  sudo apt update
  sudo apt install -y "${MISSING_PKGS[@]}"
else
  echo "✔ All required packages are already installed"
fi

echo "✔ Packages installed"

#==================================#

echo "▶ Preparing config directories..."

mkdir -p "$HOME/.config"
mkdir -p "$HOME/.local/bin"

# Copy configs
if [ -d config ] && [ "$(ls -A config 2>/dev/null)" ]; then
  cp -r config/* "$HOME/.config/"
fi

# Copy scripts
if [ -d bin ] && [ "$(ls -A bin 2>/dev/null)" ]; then
  cp -r bin/* "$HOME/.local/bin/"
  chmod +x "$HOME/.local/bin/"*
fi

echo "✔ Configs installed"

#==================================#

# Fish shell (optional)
if command -v fish >/dev/null 2>&1; then
  echo "▶ Fish detected, adding ~/.local/bin to PATH"
  fish -c "fish_add_path ~/.local/bin"
fi

echo "✔ Installation complete!"
echo "Log out and log back in to start i3."

