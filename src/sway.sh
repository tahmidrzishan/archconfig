sudo pacman -S --needed i3status alacritty wofi

mkdir -p ~/.config/sway/
cp sway_config ~/.config/sway/config
echo "Installed Sway config file in ~/.config/sway/config"
echo "Sway will automatically detect the config file"
