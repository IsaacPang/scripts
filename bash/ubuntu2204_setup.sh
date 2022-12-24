#!/usr/bin/bash

# Reminder: change execution permissions
# chmod +x <filename>

## --------------------------------------------------
## update system
## --------------------------------------------------
sudo apt update
sudo apt upgrade -y
## --------------------------------------------------

## --------------------------------------------------
## install QOL packages
## --------------------------------------------------
# common software properties
sudo apt install software-properties-common -y

# curl
sudo apt install curl -y

# stdout clipboard util
sudo apt install xclip -y
## --------------------------------------------------

## --------------------------------------------------
## setup git
## --------------------------------------------------
git config --global init.defaultBranch main
git config --global user.email isaac.pang91@gmail.com
git config --global user.name "Isaac Pang"
# check with git config --global -l
## --------------------------------------------------

## --------------------------------------------------
## setup basic keyboard bindings
## --------------------------------------------------
sudo apt install dconf-cli -y

# add config to swap esc and caps
echo "dconf write /org/gnome/desktop/input-sources/xkb-options \"['caps:swapescape']\"" >> ~/.bashrc
## --------------------------------------------------

## --------------------------------------------------
## install neovim
## --------------------------------------------------
# neovim
sudo add-apt-repository ppa:neovim-ppa/unstable -y
sudo apt update
sudo apt install neovim python3-dev python3-pip -y
## --------------------------------------------------

## --------------------------------------------------
## install touchpad-indicator
## --------------------------------------------------
# touchpad indicator - manual step required for autostart
sudo add-apt-repository ppa:atareao/atareao -y
sudo apt update
sudo apt install touchpad-indicator -y
## --------------------------------------------------

## --------------------------------------------------
## install kitty
## --------------------------------------------------
# binaries
# curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin
sudo apt install kitty -y

# view all terminal emulators and priorities
# sudo update-alternatives --config x-terminal-emulator

# make kitty the terminal default terminal emulator
sudo update-alternatives --install /usr/bin/x-terminal-emulator x-terminal-emulator `which kitty` 50
## --------------------------------------------------

## --------------------------------------------------
## install chezmoi and run
## ------------------------------------------------
# binary install
# sh -c "$(curl -fsLS get.chezmoi.io)" -- -b $HOME/.local/bin

# snap package install
snap install chezmoi --classic
## --------------------------------------------------
