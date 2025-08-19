# My Personal Dotfiles

![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)
![OS: Linux](https://img.shields.io/badge/OS-Linux-informational?style=flat&logo=linux&logoColor=white&color=2bbc8a)
![WM: Hyprland](https://img.shields.io/badge/WM-Hyprland-blueviolet?style=flat&logo=hyprland)
![Editor: Neovim](https://img.shields.io/badge/Editor-Neovim-green?style=flat&logo=neovim)
![Terminal: kitty](https://img.shields.io/badge/Terminal-kitty-lightgrey?style=flat&logo=kitty)

A collection of my personal configuration files for a sleek and productive Linux environment. This repository contains all the "dotfiles" needed to replicate my setup.

## Table of Contents

- [Screenshots](#screenshots)
- [System Details](#system-details)
- [Features](#features)
- [Installation](#installation)
- [Customization](#customization)
- [Contributing](#contributing)
- [License](#license)

## Screenshots

*(Here you can add screenshots of your desktop, editor, and other tools to showcase your setup.)*

**Desktop:**
![Desktop Screenshot](https://via.placeholder.com/800x450.png/000000/FFFFFF?text=Your+Desktop+Screenshot)

**Neovim Setup:**
![Neovim Screenshot](https://via.placeholder.com/800x450.png/000000/FFFFFF?text=Your+Neovim+Screenshot)

## System Details

This configuration is tailored for the following setup:

| Component      | Details                               |
| -------------- | ------------------------------------- |
| **OS**         | Arch Linux (but adaptable to others)  |
| **WM**         | [Hyprland](https://hyprland.org/)     |
| **Terminal**   | [kitty](https://sw.kovidgoyal.net/kitty/) |
| **Shell**      | [Zsh](https://www.zsh.org/)           |
| **Editor**     | [Neovim](https://neovim.io/)          |
| **Multiplexer**| [tmux](https://github.com/tmux/tmux)  |
| **Launcher**   | [Wofi](https://hg.sr.ht/~scoopta/wofi)  |
| **Bar**        | [Waybar](https://github.com/Alexays/Waybar) |
| **File Manager**| [Yazi](https://github.com/sxyazi/yazi) |


## Features

- **Modular & Organized:** Configurations are structured logically for easy maintenance.
- **Custom Themes:** A consistent and pleasant visual experience across all tools, based on the Nord theme.
- **Performance Optimized:** Tweaks and settings to ensure a fast and responsive system.
- **Extensive Plugins:** A curated list of plugins for Neovim, tmux, and other tools to enhance functionality.
- **Custom Keybindings:** Intuitive and efficient keybindings for Hyprland, Neovim, and more.

## Installation

Follow these steps to get started with these dotfiles.

**1. Clone the Repository**

First, clone this repository to your home directory:

```bash
git clone https://github.com/your-username/dotfiles.git ~/.dotfiles
```

**2. Backup Your Existing Dotfiles**

Before proceeding, it is crucial to back up your existing configuration files to prevent any data loss.

```bash
mkdir ~/dotfiles_backup
mv ~/.config/hypr ~/.config/kitty ~/.config/nvim ~/.zshrc ~/dotfiles_backup/
# Add any other files/directories you want to back up
```

**3. Apply Configurations**

This setup uses `stow` to manage symlinks. Make sure you have `stow` installed on your system.

From within the `~/.dotfiles` directory, run the following command to create symlinks for all the configurations:

```bash
cd ~/.dotfiles
stow .
```

This will symlink the directories and files in this repository to your `~/.config` and home directory.

## Customization

These dotfiles are designed to be easily adaptable. Here are some pointers on how to customize them for your own needs:

- **Hyprland:** The main configuration is at `~/.config/hypr/hyprland.conf`. You can modify keybindings, window rules, and other settings here. Monitor and workspace settings are in `monitors.conf` and `workspaces.conf` respectively.
- **Neovim:** The configuration is managed in Lua under `~/.config/nvim/`. You can add or remove plugins in `lua/plugins/`. Keymaps are defined in `lua/config/keymaps.lua`.
- **Theming:** Most applications are themed using a Nord color palette. You can change themes by modifying the respective configuration files (e.g., `~/.config/kitty/nord.conf`).
- **Shell:** Zsh configuration is located at `~/.zshrc`. You can customize your prompt, aliases, and shell functions here.

## Contributing

While these are my personal dotfiles, I am open to suggestions and improvements. If you have a cool idea or a better way to do something, feel free to open an issue or submit a pull request.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.