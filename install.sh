#! /bin/bash

#Function to detect pacakge manager
detect_package_manager() {
    if [ -f /etc/os-release ]; then
        . /etc/os-release
        DISTRO=$ID
    else
        echo "Cannot determine Linux Distro"
        exit 1
    fi

    case $DISTRO in
        ubuntu|debian)
            installcom="sudo apt update && sudo apt install -y"
            ;;
        fedora|centos|rhel)
            installcom="sudo dnf install -y"
            ;;
        arch)
            installcom="sudo pacman -Sy --noconfirm"
            ;;
        opensuse)
            installcom="sudo zypper install -y"
            ;;
        *)
            echo "Unsupported Distro: $DISTRO"
            exit 1
            ;;
    esac
}

#Function to install programs in the lists
install_programs() {
    programs=$1
    echo "Installing $programs..."
    $installcom $programs
}

#Detect package manager
detect_package_manager

echo "Select your preffered option:"
echo "1. Install basic (DE)"
echo "2. Install DWM + uni Stuff"
echo "3. Install Hyprland + uni Stuff"
echo "4. Exit"

read -p "Enter choice (1-4): " choice

case $choice in
    1)
        install_programs "$(< programs_basic.list)"
        ;;
    2)
        install_programs "$(< programs_basic.list)"
        install_programs "$(< programs_dwm.list)"
        install_programs "$(< programs_uni.list)"
        ;;
    3)
        install_programs "$(< programs_basic.list)"
        install_programs "$(< programs_hyprland.list)"
        install_programs "$(< programs_uni.list)"
        ;;
    4)
        echo "Exiting script."
        exit 0
        ;;
    *)
        echo "Invalid choice"
esac

echo "Do you want to install Discord using flatpak?"
echo "1. Yes"
echo "2. No"
echo "3. Exit"

read -p "Enter choice (1-3): " choice

case $choice in 
    1)
        $installcom flatpak
        flatpak install flathub com.discordapp.Discord -y
        flatpak install flathub flatseal -y
        ;;
    2)
        echo "Script continues now..."
        ;;

    3) 
        echo "Exiting script."
        exit 0
        ;;
    *)
        echo "Invalid choice"

esac

$installcom unzip


#Install FiraCode nerd font and put it in folder
FONT_URL="https://github.com/ryanoasis/nerd-fonts/releases/latest/download/FiraCode.zip"
FONT_DIR="$HOME/.local/share/fonts"

# Create the font directory if it doesn't exist
mkdir -p "$FONT_DIR"

echo "Downloading Fira Code Nerd Font..."
curl -L -o "$HOME/FiraCode.zip" "$FONT_URL"

if [ ! -f "$HOME/FiraCode.zip" ]; then
    echo "Error: Failed to download Fira Code Nerd Font."
    exit 1
fi

echo "Extracting fonts..."
unzip -o "$HOME/FiraCode.zip" -d "$FONT_DIR"

echo "Updating font cache..."
fc-cache -fv

echo "Cleaning up..."
rm "$HOME/FiraCode.zip"
rm "$HOME/.local/share/fonts/LICENSE"
rm "$HOME/.local/share/fonts/README.md"
echo "Fira Code Nerd Font installation complete!"

#Install Papirus Theme
ICONS_URL="https://github.com/PapirusDevelopmentTeam/papirus-icon-theme/releases/latest/download/papirus-icon-theme.zip"
ICONS_DIR="$HOME/.local/share/icons"

mkdir -p "$ICONS_DIR"

echo "Downloading Papirus Icon Theme..."
curl -L -o "$HOME/papirus-icon-theme.zip" "$ICONS_URL"

if [ ! -f "$HOME/papirus-icon-theme.zip" ]; then
    echo "Error: Failed to download Papirus icon theme."
    exit 1
fi

echo "Extracting icon theme..."
unzip -o "$HOME/papirus-icon-theme.zip" -d "$ICONS_DIR"

echo "Cleaning up..."
rm "$HOME/papirus-icon-theme-zip"
echo "Papirus Icon Theme Installation complete"
echo "Setting Papirus as the default icon theme..."
if command -v lxappearance &> /dev/null; then
    lxappearance --set-icon-theme Papirus
else 
    echo "lxappearance not installed, pls fix manually."
fi

echo "Papirus is now set as icon theme."



#Automated "stowing" from dotfiles

DOTFILES_DIR="$HOME/dotfiles"

if [! -d "$DOTFILES_DIR" ]; then
    echo "Dotfiles directory not found"
    exit 1
fi

echo "Stowing dotfiles..."

for dir in "$DOTFILES_DIR"/*/; do
    if [ ! -d "$dir" ]; then
        continue
    fi

    folder_name=$(basename "$dir")
    echo "Stowing $folder_name..."
    stow -d "$DOTFILES_DIR" -t "$HOME" "$folder_name"
done

echo "All folders are stowed."