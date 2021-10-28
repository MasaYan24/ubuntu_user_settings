# Ubuntu settings

# Execution
Download repository:
```sh
git clone https://github.com/MasaYan24/base_ubuntu.git
```
Then execute `base_ubuntu/install.sh`

Or execute following steps one by one.

# Install shell and basic utilities
```sh
sudo apt install -y zsh unzip ruby openssh-server
sudo apt install -y gcc make pkg-config libglvnd-dev  # for NVIDIA driver
sudo chsh -s /bin/zsh $(whoami)
```

# Install developping tools
```sh
sudo apt install -y make g++
sudo apt install -y neovim
sudo sh -c "$(curl -fsSL https://starship.rs/install.sh)" -- -y
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
sudo apt install -y ruby
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh \
    -O /tmp/miniconda.sh && sh /tmp/miniconda.sh -b -p $HOME/miniconda

sudo apt install -y imagemagick
git clone https://github.com/stefanhaustein/TerminalImageViewer.git /tmp/TIV \
    && cd /tmp/TIV/src/main/cpp \
    && make \
    && sudo make install
```

# Set .zshrc
Download **.zshrc** from https://github.com/MasaYan24/zshrc
```sh
wget https://raw.githubusercontent.com/MasaYan24/zshrc/main/.zshrc -P $HOME/
```

Example:
```sh
  
# Path
PATH=~/bin:$PATH

export VISUAL=nvim
export EDITOR="$VISUAL"

# History
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Use modern completion system
autoload -Uz compinit
compinit

# starship hook
eval "$(starship init zsh)"

# miniconda hook
eval "$($HOME/miniconda/bin/conda shell.zsh hook)"

# zsh-autosuggestions hook
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# Alias
alias vi='nvim'
alias ls="ls --color"
```

# Setting for .vimrc
```sh
git clone https://github.com/MasaYan24/.vim.git
$HOME/.vim/install.sh
```
Execute following if necessary when opening nvim
```vim
:UpdateRemotePlugins
```

# git setting
```sh
git config --global core.editor vi
git config --global merge.tool vimdiff
git config --global merge.conflictstyle diff3
git config --global mergetool.prompt false
git config --global credential.helper "cache --timeout 604800"
git config --global core.pager "LESSCHARSET=utf-8 less"
```
