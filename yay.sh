#! /bin/bash

sudo pacman -Syu --noconfirm go

# Define the installation directory
INSTALL_DIR="$HOME/build"

# Create the installation directory if it doesn't exist
mkdir -p "$INSTALL_DIR"

# Navigate to the installation directory
cd "$INSTALL_DIR" || { echo "Failed to navigate to $INSTALL_DIR"; exit 1; }

# Clone the yay repository from AUR
if ! git clone https://aur.archlinux.org/yay-git.git; then
    echo "Failed to clone yay repository"
    exit 1
fi

# Navigate into the yay directory
cd yay-git || { echo "Failed to navigate to yay-git directory"; exit 1; }

# Build and install yay
if ! makepkg -si --noconfirm; then
    echo "Failed to build and install yay"
    exit 1
fi

echo "yay has been successfully installed!"