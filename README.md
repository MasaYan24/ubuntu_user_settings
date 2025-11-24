# Ubuntu User Settings for myself

## Setting Up
Execute following
```sh
install_dir=$(mktemp -d); echo install_dir: $install_dir
myrepo="setting_ubuntu_user_masayan"
git clone https://github.com/MasaYan24/${myrepo}.git $install_dir/$myrepo/
sh $install_dir/$myrepo/install.sh
```

Or install one by one in the manual installation section

### Note
If your computer is under a proxy, execute following before executing set-up script.
```sh
# modify the IP and port number
export http_proxy="http://your/proxy/IP:PortNumber"
export https_proxy="http://your/proxy/IP:PortNumber"
export ftp_proxy="http://your/proxy/IP:PortNumber"
```
The above commands have to be executed everytime you restart the shell.

After all the installation is complete, add the same commands to `~/.zshrc`

## Summary
This setting includes following objects under assuming z-shell.

- prompto setting using starship
- zsh auto suggestion
- import .zshrc
- Miniconda installation
- Neovim setting
- git setting

## Manual Installation

### Prompto setting
```sh
mkdir -p $HOME/.config && echo "command_timeout = 2000" > $HOME/.config/starship.toml
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
if [ -e $HOME/.zshrc ]; then mv ＄HOME/.zshrc $HOME/.zshrc.bkup; fi
wget https://raw.githubusercontent.com/MasaYan24/zshrc/main/.zshrc $HOME/.zshrc
```

### Developing tool
```sh
installer=$(mktemp -d)/miniconda_install.sh
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh \
  -O $installer
sh $installer -b -p $HOME/.miniconda
```

### Neovim setting
```sh
git clone https://github.com/MasaYan24/vim.git $HOME/.vim
sh $HOME/.vim/install.sh
```

### git setting
```sh
git config --global core.editor vi
git config --global merge.tool vimdiff
git config --global merge.conflictstyle diff3
git config --global mergetool.prompt false
git config --global credential.helper "cache --timeout 604800"
brew install git-delta \
    && git config --global core.pager "delta" \
    && git config --global interactive.diffFilter "delta --color-only" \
    && git config --global delta.navigate true
```

Then restart your shell to activate conda
