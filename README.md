# ubuntu user settings

Execute following
```sh
git clone https://github.com/MasaYan24/ubuntu_user_settings.git
sh ./ubuntu_user_settings/install.sh
```
or install one by one as follows.

## Neovim setting
```sh
git clone https://github.com/MasaYan24/vim.git $HOME/.vim
sh $HOME/.vim/install.sh
```

## Prompto setting
```sh
mkdir -p $HOME/.config && echo "command_timeout = 2000" > $HOME/.config/starship.toml
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
wget https://raw.githubusercontent.com/MasaYan24/zshrc/main/.zshrc -P $HOME/
```

## Developing tool
```sh
installer=$(mktemp).sh
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh \
  -O $installer
sh $installer -b -p $HOME/.miniconda
```

## Path setting
```sh
echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> $HOME/.zprofile
```

## git setting
```sh
git config --global core.editor vi
git config --global merge.tool vimdiff
git config --global merge.conflictstyle diff3
git config --global mergetool.prompt false
git config --global credential.helper "cache --timeout 604800"
git config --global core.pager "LESSCHARSET=utf-8 less"
```

Then restart your shell to activate conda
