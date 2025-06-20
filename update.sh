#!/bin/bash

read -p "Want to update this folder with your local config? y/N: " prompt
read -p "Your sure about that? y/N: " prompt

if [[ "$prompt" == "y" || "$prompt" == "Y" ]]; then
    echo "Executing"
    cp ~/.config/sway/config ./sway_config
    cp ~/.config/i3/config ./i3_config
else
    echo "Not executing"
fi

echo "Quitting..."
