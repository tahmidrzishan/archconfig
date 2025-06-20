sudo pacman -S --needed brightnessctl i3 i3status alacritty dmenu feh rofi xorg-xinit xorg-server
cp i3_config ~/.config/i3/config
echo "Installed i3 config file in ~/.config/i3/config"
echo "i3 Window Manager will automatically detect the config file"

#!/bin/bash

# Script to configure touchpad settings for X11 using libinput

CONFIG_DIR="/etc/X11/xorg.conf.d"
CONFIG_FILE="$CONFIG_DIR/40-libinput.conf"

# Ensure script is run as root
if [[ $EUID -ne 0 ]]; then
  echo "Please run this script as root (use sudo)"
  exit 1
fi

# Create config directory if needed
mkdir -p "$CONFIG_DIR"

# Write the configuration
cat <<EOF > "$CONFIG_FILE"
Section "InputClass"
    Identifier "touchpad"
    MatchIsTouchpad "on"
    Driver "libinput"
    Option "Tapping" "on"
    Option "TappingDrag" "on"
    Option "TappingDragLock" "on"
    Option "NaturalScrolling" "true"
    Option "PalmDetection" "on"
    Option "DisableWhileTyping" "on"
    Option "ClickMethod" "clickfinger"
EndSection
EOF

echo "Touchpad configuration written to: $CONFIG_FILE"
echo "Please reboot or restart X to apply changes."
