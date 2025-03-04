#!/bin/sh

echo "Installing FiraCode Nerd Font..."

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
