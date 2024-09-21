#! /bin/bash

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

sleep 2

sudo pacman -Sy xorg xorg-xinit base-devel github-cli firefox neovim fastfetch feh starship lxappearance wget z okular flameshot stow trash-cli --no-confirmation --needed

stow

sleep 1

cd $HOME/.config/dwm
sudo make clean install
cd $HOME/.config/dmenu
sudo make clean install
cd $HOME/.config/slstatus
sudo make clean install
cd $HOME/.config/st
sudo make clean install
