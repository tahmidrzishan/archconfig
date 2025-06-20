#!/bin/bash

read -p "Want to update this folder with your local config? y/N: " prompt
read -p "You sure about that? y/N: " prompt

if [[ "$prompt" == "y" || "$prompt" == "Y" ]]; then
    echo "Executing..."
    echo "Updating Sway config file"
    cp ~/.config/sway/config ./src/sway_config
    echo "Updating i3 config file"
    cp ~/.config/i3/config ./src/i3_config
else
    echo "Not executing..."
fi

echo "Quitting update script..."
