#!/bin/bash

# Flutter Installation Script for Arch Linux
# This script installs Flutter SDK and all required dependencies

echo "===== Flutter Installation Script for Arch Linux ====="
echo "This script will install Flutter and all required dependencies"

# Exit if any command fails
set -e

# Function to check if a package is installed
is_installed() {
  pacman -Qi "$1" &> /dev/null
  return $?
}

# Update system
echo "Updating system packages..."
sudo pacman -Syu --noconfirm

# Install required dependencies
echo "Installing required dependencies..."
DEPS=("git" "curl" "unzip" "xz" "zip" "clang" "cmake" "ninja" "pkg-config" "gtk3" "jdk-openjdk" "android-tools")

for dep in "${DEPS[@]}"; do
  if ! is_installed "$dep"; then
    echo "Installing $dep..."
    sudo pacman -S --noconfirm "$dep"
  else
    echo "$dep is already installed."
  fi
done

# Install yay (AUR helper) if not installed
if ! command -v yay &> /dev/null; then
  echo "Installing yay AUR helper..."
  git clone https://aur.archlinux.org/yay.git
  cd yay
  makepkg -si --noconfirm
  cd ..
  rm -rf yay
fi

# Install Android Studio from AUR if not installed
if ! is_installed "android-studio"; then
  echo "Installing Android Studio..."
  yay -S --noconfirm android-studio
fi

# Create a directory for Flutter SDK
FLUTTER_PATH="$HOME/development"
mkdir -p "$FLUTTER_PATH"
cd "$FLUTTER_PATH"

# Download and extract Flutter SDK
if [ ! -d "$FLUTTER_PATH/flutter" ]; then
  echo "Downloading Flutter SDK..."
  git clone https://github.com/flutter/flutter.git -b stable
else
  echo "Flutter SDK already exists, updating..."
  cd "$FLUTTER_PATH/flutter"
  git fetch
  git checkout stable
  git pull
fi

# Add Flutter to PATH in bash and zsh profiles if needed
update_profile() {
  local profile_file="$1"
  if [ -f "$profile_file" ]; then
    if ! grep -q "export PATH=\"\$PATH:$FLUTTER_PATH/flutter/bin\"" "$profile_file"; then
      echo "Updating $profile_file..."
      echo "" >> "$profile_file"
      echo "# Flutter" >> "$profile_file"
      echo "export PATH=\"\$PATH:$FLUTTER_PATH/flutter/bin\"" >> "$profile_file"
    fi
  fi
}

update_profile "$HOME/.bashrc"
update_profile "$HOME/.zshrc"

# Update current session PATH
export PATH="$PATH:$FLUTTER_PATH/flutter/bin"

echo "Verifying Flutter installation..."
flutter --version

echo "Running Flutter doctor to check setup..."
flutter doctor

echo ""
echo "===== Flutter Installation Complete ====="
echo "Flutter has been installed to: $FLUTTER_PATH/flutter"
echo ""
echo "Please ensure you complete any remaining steps identified by 'flutter doctor'"
echo "You may need to restart your terminal or run 'source ~/.bashrc' to update your PATH"
echo ""
echo "Next steps:"
echo "1. Run 'flutter doctor --android-licenses' to accept Android licenses"
echo "2. Open Android Studio and install any requested SDK components"
echo "3. Run 'flutter doctor' again to verify all issues are resolved"
