#!/bin/sh

# set installing work dir
workdir=$(mktemp -d)
echo "install workdir: $workdir"

# make user bin dir
mkdir -p $HOME/bin

# Prompto setting
if command -v brew >/dev/null 2>&1; then
    brew install starship
else
    wget https://starship.rs/install.sh -O $workdir/starship_install.sh
    sh $workdir/starship_install.sh -b $HOME/bin -y
fi
mkdir -p $HOME/.config && echo "command_timeout = 2000" > $HOME/.config/starship.toml
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions

# .zshrc setting
if [ -e $HOME/.zshrc ]; then mv $HOME/.zshrc $HOME/.zshrc.bkup; fi
wget https://raw.githubusercontent.com/MasaYan24/zshrc/main/.zshrc -O $HOME/.zshrc

# Developing tool
# installer=$workdir/miniconda_install.sh
# wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O $installer \
#     && sh $installer -b -p $HOME/.miniconda
# $HOME/.miniconda/bin/conda config --set auto_activate_base False
# $HOME/.miniconda/bin/conda config --add channels conda-forge
# $HOME/.miniconda/bin/conda config --remove channels defaults
# $HOME/.miniconda/bin/conda config --show channels
# grep -qxF 'export PATH=$HOME/.miniconda/bin:$PATH' $HOME/.zshrc || echo 'export PATH=$HOME/.miniconda/bin:$PATH' >> $HOME/.zshrc
installer=$workdir/miniforge_install.sh
wget "https://github.com/conda-forge/miniforge/releases/latest/download/Miniforge3-$(uname)-$(uname -m).sh" -O $installer \
    && bash $installer -b -p $HOME/.miniforge
$HOME/.miniforge/bin/conda config --set auto_activate False
$HOME/.miniforge/bin/conda config --show channels
grep -qxF 'export PATH=$HOME/.miniforge/bin:$PATH' $HOME/.zshrc || echo 'export PATH=$HOME/.miniforge/bin:$PATH' >> $HOME/.zshrc

# Neovim setting
git clone https://github.com/MasaYan24/vim.git $HOME/.vim \
    && sh $HOME/.vim/install.sh

# git setting
git config --global core.editor vi
git config --global merge.tool vimdiff
git config --global merge.conflictstyle diff3
git config --global mergetool.prompt false
git config --global credential.helper "cache --timeout 604800"
brew install git-delta \
    && git config --global core.pager "delta" \
    && git config --global interactive.diffFilter "delta --color-only" \
    && git config --global delta.navigate true

echo "Restart your shell to activate conda"
