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
echo "1. Install basic"
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

sleep 1

$installcom unzip

sleep 1

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
