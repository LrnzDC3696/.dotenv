# What I did

## Setting up termux

### Initial stuff

1. `pkg update -y && pkg upgrade -y`
1. `termux-setup-storage`

### Getting the github repository

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
