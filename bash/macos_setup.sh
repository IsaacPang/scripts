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
# or use the base python
# /usr/bin/python3 -m pip install pynvim neovim

# update certificates for python
python -m pip install --upgrade certifi

# python micro-version depends on the python installation
open /Applications/Python\ 3.11/Install\ Certificates.command
## --------------------------------------------------

## --------------------------------------------------
## install poetry
## --------------------------------------------------
curl -sSL https://install.python-poetry.org | python3 -

# add to the path
echo '# add local bin to path\nexport PATH="/Users/ispang/.local/bin:$PATH"' >> ~/.zshrc
## --------------------------------------------------

## --------------------------------------------------
## install nvm
## --------------------------------------------------
brew install nvm
mkdir ~/.nvm
echo "# nvm commands\nexport NVM_DIR=~/.nvm\nsource \$(brew --prefix nvm)/nvm.sh" >> .zshrc

# install various nvm versions
nvm install 18
nvm install 16
nvm install 12
## --------------------------------------------------
