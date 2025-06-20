#!/bin/bash

set -e

echo "==> Installing earlyoom..."
sudo pacman -S --noconfirm earlyoom --needed
sudo systemctl enable --now earlyoom.service

# Ask user for swap size
read -p "Enter swap size in GB (e.g., 2): " SWAPSIZE_GB

# Validate input
if ! [[ "$SWAPSIZE_GB" =~ ^[0-9]+$ ]]; then
    echo "Invalid input. Please enter a numeric value."
    exit 1
fi

SWAPFILE="/swapfile"

# Disable and remove existing swap if present
if swapon --show | grep -q "$SWAPFILE"; then
    echo "==> Disabling existing swapfile..."
    sudo swapoff "$SWAPFILE"
fi

if [ -f "$SWAPFILE" ]; then
    echo "==> Deleting existing swapfile..."
    sudo rm -f "$SWAPFILE"
fi

# Clean any old swapfile entries from fstab
sudo sed -i '\|/swapfile|d' /etc/fstab

# Create new swapfile
echo "==> Creating ${SWAPSIZE_GB}G swapfile at $SWAPFILE..."
sudo fallocate -l ${SWAPSIZE_GB}G "$SWAPFILE"
sudo chmod 600 "$SWAPFILE"
sudo mkswap "$SWAPFILE"
sudo swapon "$SWAPFILE"
echo "$SWAPFILE none swap defaults 0 0" | sudo tee -a /etc/fstab

# Configure earlyoom
echo "==> Configuring earlyoom..."
if [ ! -f /etc/default/earlyoom ]; then
    echo 'EARLYOOM_ARGS="-r 60 -m 10 -s 20"' | sudo tee /etc/default/earlyoom
else
    echo "earlyoom config exists. Not overwriting."
fi
sudo systemctl restart earlyoom.service

echo "==> Setup complete. Swap and earlyoom are now active."
