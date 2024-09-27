#! /bin/bash

sudo pacman -Sy xorg xorg-xinit base-devel github-cli firefox neovim fastfetch feh starship lxappearance wget zoxide okular flameshot stow trash-cli bat bash-completion fzf tree npm zathura texlive-binextra thunderbird --noconfirm

sleep 1

#cd $HOME/.config/dwm
#sudo make clean install
#cd $HOME/.config/dmenu
#sudo make clean install
#cd $HOME/.config/slstatus
#sudo make clean install
#cd $HOME/.config/st
#sudo make clean install

FONT_URL="https://github.com/ryanoasis/nerd-fonts/releases/latest/download/FiraCode.zip"
FONT_DIR="$HOME/.local/share/fonts"

# Create the font directory if it doesn't exist
mkdir -p "$FONT_DIR"

echo "Installing required packages..."
sudo pacman -S --noconfirm curl unzip fontconfig

echo "Downloading Fira Code Nerd Font..."
curl -L -o "$HOME/FiraCode.zip" "$FONT_URL"

echo "Extracting fonts..."
unzip -o "$HOME/FiraCode.zip" -d "$FONT_DIR"

echo "Updating font cache..."
fc-cache -fv

echo "Cleaning up..."
rm "$HOME/FiraCode.zip"

echo "Fira Code Nerd Font installation complete!"