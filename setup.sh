# Terminal Stuff
termux-setup-storage
apt -y update && apt -y upgrade



# Install Packages
pkg install -y gh git
pkg install -y python nodejs clang rust # other language are needed for other features
pkg install -y sqlite
pkg install -y tree xargs fzf



# Setting Up

## Python

### Virtual Env
pip install pipenv

### Required for pillow
pkg install libjpeg-turbo
# LDFLAGS="-L/system/lib/" CFLAGS="-I/data/data/com.termux/files/usr/include/" pip install Pillow


## Vim

### For telescope
pkg -y install ripgrep

### For tree sitter
npm install -g neovim

### Installing Plugin Manager
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

