#! /bin/bash

echo "Updating system..."
sudo pacman -Sy  # Refresh package cache


read -p "Upgrade system? This may take some time and eat storage. y/N: " prompt
if [[ "$prompt" == "y" || "$prompt" == "Y" ]]; then
	sudo pacman -Syu
fi

echo "Installing necessary tools..."
sudo pacman -S --needed base-devel git brightnessctl alacritty fastfetch ttf-jetbrains-mono-nerd

echo "Setting JetBrains Mono Nerd Font as default for alacritty.(Terminal Emulator)"
mkdir -p "~/.config/alacritty/"
echo "Installed JetBrains Mono Nerd font as default for alacitty (Terminal Emulator)"
cp "./src/alacitty.toml" "~/.config/alacritty/alacritty.toml"

echo "An AUR helper will help you install packages from Arch User Repository(AUR) that are not available through pacman."
read -p "Install yay as AUR helper? y/N: " prompt

if [[ "$prompt" == "y" || "$prompt" == "Y" ]]; then
    
	echo "Installing yay as AUR helper"
	git clone https://aur.archlinux.org/yay-git.git
	cd yay-git
	makepkg -si
	yay --version
	cd ..
	echo "Removing yay-git folder..."
	sudo rm -rf ./yay-git
fi

echo "EarlyOOM will automatically manage your RAM and prevent it from freezing."
read -p "Install and setup EarlyOOM? y/N: " prompt
if [[ "$prompt" == "y" || "$prompt" == "Y" ]]; then
	chmod +x ./src/earlyoom.sh
	./src/earlyoom.sh
fi

##install i3 or sway

echo "If you're using an older system, like before 2020, i3 (X11) might be a better choice for you. Other than that, Sway (Wayland) is good for you. Which window manager do you want to install?"
echo "[1] i3, [2] Sway, [0] None"
read -p "Which one to install? (Default: [0]) : " prompt
if [[ "$prompt" == "1" ]]; then
#	chmod +x ./src/install_i3.sh
#	./src/install_i3.sh
	echo "Installing i3 window manager with config."
elif [[ "$prompt" == "2" ]]; then
#	chmod +x ./src/install_sway.sh
#	./src/install_sway.sh
	echo "Installing Sway with config"
else
	echo "Didn't install any window manager."
fi


read -p "Prefer dark mode for GTK apps? y/N: " prompt
if [[ "$prompt" == "y" || "$prompt" == "Y" ]]; then
	sudo pacman -S gnome-themes-extra --needed
	mkdir -p ~/.config/gtk-3.0/
	mkdir -p ~/.config/gtk-4.0/
	sudo cp ./src/gtksettings ~/.config/gtk-3.0/settings.ini
	sudo cp ./src/gtksettings ~/.config/gtk-4.0/settings.ini
fi


echo "Installation complete. Quitting..."


exec fastfetch
