# Automated configuration for Arch Linux

This repository contains my personal configuration files for Arch Linux. It has the basic utilities like yay, earlyoom and tiling window managers like sway and i3. It includes install scripts to easily apply the configs to your system. A star would be great if this helped you. Reach out to me at:
[tahmidzishan53@gmail.com]   [LinkedIn](https://bd.linkedin.com/in/tahmidrzishan)

## 📁 Repository Structure

```
.
├── src/         # Folder containing the scripts. You can read if you want
├── install.sh   # Script to install things you need
├── update.sh    # This is for the author to update the repo
└── README.md    # You're reading this!
```

---

## 🚀 Installation

> ⚠️ Before proceeding, make sure you **backup your existing config files** if needed.
---
First make sure that git is installed on your system.
```bash
git --version
```
If it spits out a version number, you're good to go. 
Now, let's clone this repository into your local machine and install the settings.
Use these commmands below to run the install script.

```bash
git clone https://github.com/tahmidrzishan/archconfig.git
cd ./archconfig
chmod +x install.sh
./install.sh
```

The script will guide you through the setup. You can install what you need, and don't have to install what you don't.

---
## 🛠 Customization

Feel free to modify the `sway_config` and `i3_config` files as needed. After making changes, run the `update.sh` script to save them back to this repo.

---

## 📌 License

You are free to use and modify these config files. A credit would be appreciated if you find it helpful!

