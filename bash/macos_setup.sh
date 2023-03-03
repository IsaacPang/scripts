#!/usr/bin/bash

# Reminder: change execution permissions
# chmod +x <filename>

## --------------------------------------------------
## install homebrew
## --------------------------------------------------
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
## --------------------------------------------------

## --------------------------------------------------
## install neovim
## --------------------------------------------------
# latest version
brew install --HEAD neovim

# update neovim nightly
brew upgrade neovim --fetch-HEAD
## --------------------------------------------------

## --------------------------------------------------
## check python installations
## --------------------------------------------------
#install neovim dependencies
python -m pip install pynvim neovim

# update certificates for python
python -m pip install --upgrade certifi

# python micro-version depends on the python installation
open /Applications/Python\ 3.11/Install\ Certificates.command
## --------------------------------------------------

