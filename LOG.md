# What I did

## Setting up termux

### Initial stuff

1. `pkg update -y && pkg upgrade -y`
1. `termux-setup-storage`

### Getting dotfiles from repo

<https://www.atlassian.com/git/tutorials/dotfiles>

1. `pkg install git`
1. `alias config='$PREFIX/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'`
1. `echo ".cfg" >> .gitignore`
1. `git clone --bare https://github.com/m0nk3ybraindead/.dotenv.git $HOME/.cfg`
1. `alias config='$PREFIX/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'`
1. `config checkout`
1. `config config --local status.showUntrackedFiles no`
1. `config status`
1. **I am done**

## Setting up code environment

### Cool stuff first

1. `pkg install -y fzf`

### Tmux

1. `pkg install -y tmux`

### Nvim

1. Installing Plugin Manager \
    `sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'`
1. Installing Dependencies
    * Github Copilot `pkg install nodejs -y`
    * Coc nvim `pkg install nodejs -y`
1. Installing the Plugins 
    * `:PlugInstall`
1. Setting up the plugins
    * Github Copilot `:Copilot Setup`
    * Coc `:CocInstall coc-pyright`

### Python

1. `pkg install python -y`
1. `pip install pipenv`

#### Special Cases

Installing Pillow
1. `pkg install libjpeg-turbo`
1. `LDFLAGS="-L/system/lib/" CFLAGS="-I/data/data/com.termux/files/usr/include/"`
1. `pip install Pillow`

### Github

1. `pkg install gh -y`

### Other useful tools

`tree`