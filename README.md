# Dotfiles for Sway & i3 Window Managers

This repository contains my personal configuration files for the **Sway** and **i3** window managers. It includes install scripts to easily apply the configs to your system and an update script to sync your local changes back to the repository.

## 📁 Repository Structure

```
.
├── sway_config          # Sway config file
├── i3_config            # i3 config file
├── install_sway.sh      # Script to install Sway config
├── install_i3.sh        # Script to install i3 config
├── update.sh            # Script to update repo with local configs
└── README.md            # You're reading this!
```

---

## 🚀 Installation

> ⚠️ Before proceeding, make sure you **backup your existing config files** if needed.

### 📥 Install Sway Config

This will replace your existing `~/.config/sway/config` file with the one from this repo.

```bash
chmod +x install_sway.sh
./install_sway.sh
```

### 📥 Install i3 Config

This will replace your existing `~/.config/i3/config` file with the one from this repo.

```bash
chmod +x install_i3.sh
./install_i3.sh
```

---

## 🔄 Update This Repo with Your Local Changes

If you've made changes to your configs locally and want to sync them back to this repository:

```bash
chmod +x update.sh
./update.sh
```

The script will ask you for confirmation before overwriting the repo files with your local configs.

---

## ✅ Requirements

Make sure the following directories exist before running the install scripts:

- `~/.config/sway/`
- `~/.config/i3/`

You can create them using:

```bash
mkdir -p ~/.config/sway
mkdir -p ~/.config/i3
```

---

## 🛠 Customization

Feel free to modify the `sway_config` and `i3_config` files as needed. After making changes, run the `update.sh` script to save them back to this repo.

---

## 📌 License

You are free to use and modify these config files. A credit would be appreciated if you find it helpful!

---

## 💬 Feedback

Feel free to open issues or pull requests if you want to suggest improvements or report problems.
