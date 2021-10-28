# AWS EC2 settings

# Execution
Download repository:
```sh
git clone https://github.com/MasaYan24/aws.git
```
Then execute `aws/install.sh`

Or execute following steps one by one.

# Install basic tools
```sh
sudo apt install unzip
```

# Setting shell
```sh
sudo apt install -y zsh
sudo chsh -s /bin/zsh $(whoami)
```

# AWS CLI install
[Linux での AWS CLI バージョン 2 のインストール](https://docs.aws.amazon.com/ja_jp/cli/latest/userguide/install-cliv2-linux.html)
```sh
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "/tmp/awscliv2.zip"
unzip /tmp/awscliv2.zip -d /tmp
sudo /tmp/aws/install
```

# AWS Lustre client install
[Ubuntu 20.04 に Lustre クライアントをインストールするには](https://docs.aws.amazon.com/ja_jp/fsx/latest/LustreGuide/install-lustre-client.html)
```sh
wget -O - https://fsx-lustre-client-repo-public-keys.s3.amazonaws.com/fsx-ubuntu-public-key.asc \
    | sudo apt-key add -
sudo bash -c 'echo "deb https://fsx-lustre-client-repo.s3.amazonaws.com/ubuntu focal main" \
    > /etc/apt/sources.list.d/fsxlustreclientrepo.list && apt-get update'
uname -r
sudo apt install -y linux-aws lustre-client-modules-aws
sudo apt install -y lustre-client-modules-$(uname -r)

sudo mkdir -p /fsx
echo "fs-0c0ef9a72a43628cf.fsx.us-east-1.amazonaws.com@tcp:/kazypbmv  /fsx  lustre  noatime,flock 0 0" | sudo tree -a /etc/fstab
sudo mkdir -p /fsx2
echo " fs-0bf1d8b03ebd7ce81.fsx.us-east-1.amazonaws.com@tcp:/zgb3pbmv /fsx2 lustre  noatime,flock 0 0" | sudo tree -a /etc/fstab
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

# bitbucket setting
```sh
aws s3 cp s3://dn-mlpl-share/settings/bitbucket/ ~/.bitbucket --recursive
git config --global http.sslCert "~/.bitbucket/client.cert"
git config --global http.sslKey "~/.bitbucket/client.key"
git config --global http.sslVerify "true"
git config --global user.name "Masahiro Takahashi"
git config --global user.email masahiro.takahashi.j7x@jp.denso.com
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

# MLProject specific
```sh
mkdir $HOME/MLProjects
cd $HOME/MLProjects
git clone https://scm.dndev.net/sn11/stash/scm/~2386995/mmpose_dn.git
git clone https://scm.dndev.net/sn11/stash/scm/~2386995/mmpose_hirohashi.git
git clone https://scm.dndev.net/sn11/stash/scm/~2386995/mlpl_pipelines.git
```

# mmpose specific (@ each project dirs)
```sh
pip install -U pre-commit
pre-commit install
```

# Note
- https://scm.dndev.net/sn11/stash/scm/dasml/mmpose.git
- https://scm.dndev.net/sn11/stash/scm/dasmlpl/mlpl_pipelines.git
- https://scm.dndev.net/sn11/stash/scm/~2386995/mlpl_pipelines.git
