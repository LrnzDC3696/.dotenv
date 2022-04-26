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

### Github

1. `pkg install gh -y`
1. `gh auth login`

### Cool stuff

1. `pkg install -y fzf tree neofetch`

### Tmux

1. `pkg install -y tmux`

### Nvim

1. Move coc-settings.json and plugin/coc.vim
    * `nvimrc`
    * `mv {coc-settings.json,plugin/coc.vim} ..`
1. Installing Plugin Manager \
    `sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim
    --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'`
1. Installing Dependencies
    * Github Copilot `pkg install nodejs -y`
    * Coc nvim `pkg install nodejs -y`
    * Telescope `pkg install ripgrep -y`
1. Installing the Plugins
    * `:PlugInstall`
1. Setting up the plugins
    * Github Copilot `:Copilot Setup`
    * Coc `:CocInstall coc-pyright`
1. Putting back Coc
    * `mv ../coc-settings.json .`
    * `mv ../coc.vim plugin/.`

### Python

1. `pkg install python -y`
1. `pip install pipenv`

#### Special Cases

Installing Cryptography

1. `pkg install clang`
1. `pkg install libcrypt`
1. `pkg install libffi`
1. `export CARGOT_BUILD_TARGET=armv7-linux-androideabi`
    replace aarch64-linux-android with armv7-linux-androideabi if your phone is arm(32bit)

Installing Pillow

1. `pkg install libjpeg-turbo`
1. `LDFLAGS="-L/system/lib/" CFLAGS="-I/data/data/com.termux/files/usr/include/"`
1. `pip install Pillow`
