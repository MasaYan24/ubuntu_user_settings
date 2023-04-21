#!/bin/sh

# install homebrew
NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Neovim setting
git clone https://github.com/MasaYan24/.vim.git $HOME/
sh $HOME/.vim/install.sh

# Prompto setting
# sudo sh -c "$(curl -fsSL https://starship.rs/install.sh)" -- -y
brew install starship
mkdir -p $HOME/.config && echo "command_timeout = 2000" > $HOME/.config/starship.toml
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
wget https://raw.githubusercontent.com/MasaYan24/zshrc/main/.zshrc -P $HOME/

# Developing tool
installer=$(mktemp)
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh \
  -O $installer
sh $installer -b -p $HOME/.miniconda

# git setting
git config --global core.editor vi
git config --global merge.tool vimdiff
git config --global merge.conflictstyle diff3
git config --global mergetool.prompt false
git config --global credential.helper "cache --timeout 604800"
git config --global core.pager "LESSCHARSET=utf-8 less"

# Python formatter
conda activate base
pip install black isort flake8 autopep8
