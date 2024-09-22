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

sudo pacman -Sy xorg xorg-xinit base-devel github-cli firefox neovim fastfetch feh starship lxappearance wget zoxide okular flameshot stow trash-cli bat bash-completion fzf tree npm zathura texlive-binextra --no-confirmation --needed

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


FONT_NAME="FiraCodeNerdFont"
    if fc-list :family | grep -iq "$FONT_NAME"; then
        printf "%b\n" "${GREEN}Font '$FONT_NAME' is installed.${RC}"
    else
        printf "%b\n" "${YELLOW}Installing font '$FONT_NAME'${RC}"
        # Change this URL to correspond with the correct font
        FONT_URL="https://github.com/ryanoasis/nerd-fonts/releases/download/latest/FiraCode.zip"
        FONT_DIR="$HOME/.local/share/fonts"
        TEMP_DIR=$(mktemp -d)
        curl -sSLo "$TEMP_DIR"/"${FONT_NAME}".zip "$FONT_URL"
        unzip "$TEMP_DIR"/"${FONT_NAME}".zip -d "$TEMP_DIR"
        mkdir -p "$FONT_DIR"/"$FONT_NAME"
        mv "${TEMP_DIR}"/*.ttf "$FONT_DIR"/"$FONT_NAME"
        fc-cache -fv
        rm -rf "${TEMP_DIR}"
        