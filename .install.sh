#!/bin/bash

# Update package list
sudo apt update

# Node.js, npm, and Cargo installation for various plugins
sudo apt install -y nodejs npm

# Install Rust (cargo) non-interactively
curl https://sh.rustup.rs -sSf | sh -s -- -y

# Install Telescope ripgrep
curl -LO https://github.com/BurntSushi/ripgrep/releases/download/14.1.0/ripgrep_14.1.0-1_amd64.deb
sudo dpkg -i ripgrep_14.1.0-1_amd64.deb
rm ripgrep_14.1.0-1_amd64.deb  # Cleanup

# Install MiniConda
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash Miniconda3-latest-Linux-x86_64.sh -b  # -b for silent mode (no prompts)
rm Miniconda3-latest-Linux-x86_64.sh  # Cleanup

# Reload shell to apply changes (optional)
exec $SHELL
