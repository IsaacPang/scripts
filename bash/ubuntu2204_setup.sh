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
## QOL packages
## --------------------------------------------------
# common software properties
sudo apt install software-properties-common -y

# curl
sudo apt install curl -y

# stdout clipboard util
sudo apt install xclip -y
## --------------------------------------------------

## --------------------------------------------------
## git
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
## --------------------------------------------------

## --------------------------------------------------
## nvm
## --------------------------------------------------
# install package
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
echo "nvm installed"

# install LTS versions and latest version of node
nvm install --lts 12
nvm install --lts 14
nvm install --lts 
nvm install node
echo "node packages installed"

# use the lts version
nvm use --lts
echo "Using node $(nvm current)"
## --------------------------------------------------

## --------------------------------------------------
## neovim
## --------------------------------------------------
# neovim
sudo add-apt-repository ppa:neovim-ppa/unstable -y
sudo apt update
sudo apt install neovim python3-dev python3-pip -y

# telescope
sudo apt install ripgrep fd-find -y
## --------------------------------------------------

## --------------------------------------------------
## touchpad-indicator
## --------------------------------------------------
# manual step required for autostart
sudo add-apt-repository ppa:atareao/atareao -y
sudo apt update
sudo apt install touchpad-indicator -y
## --------------------------------------------------

## --------------------------------------------------
## kitty
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
## oh-my-bash
## --------------------------------------------------
bash -c "$(curl -fsSL https://raw.githubusercontent.com/ohmybash/oh-my-bash/master/tools/install.sh)"
## --------------------------------------------------

## --------------------------------------------------
## ranger
## --------------------------------------------------
# refer to wiki https://wiki.archlinux.org/title/ranger
sudo apt install ranger -y
ranger --copy-config=all
## --------------------------------------------------

## --------------------------------------------------
## python packages
## --------------------------------------------------
# neovim
pip install neovim

# general coding
pip install black isort Pillow
## --------------------------------------------------

## --------------------------------------------------
## chezmoi
## --------------------------------------------------
# binary install
# sh -c "$(curl -fsLS get.chezmoi.io)" -- -b $HOME/.local/bin

# snap package install
snap install chezmoi --classic

# setup on a new machine
chezmoi init --apply https://github.com/IsaacPang/dotfiles.git
## --------------------------------------------------
