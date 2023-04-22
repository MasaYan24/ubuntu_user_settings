#!/bin/sh

# Neovim setting
git clone https://github.com/MasaYan24/vim.git $HOME/.vim
sh $HOME/.vim/install.sh

# Prompto setting
mkdir -p $HOME/.config && echo "command_timeout = 2000" > $HOME/.config/starship.toml
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
if [ -e $HOME/.zshrc ]; then mv $HOME/.zshrc{,.bkup}; fi
wget https://raw.githubusercontent.com/MasaYan24/zshrc/main/.zshrc -O $HOME/.zshrc

# Developing tool
installer=$(mktemp -d)/install_miniconda.sh
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

echo "Restart your shell to activate conda"
