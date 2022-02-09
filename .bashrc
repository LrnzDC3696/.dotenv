#!/data/data/com.termux/files/usr/bin bash

if [ -r 'storage/shared' ]
then

  CODE='storage/shared/Codes'
  if ! [ -r $CODE ]
  then
    mkdir storage/shared/Codes
  fi

  SCRIPT='storage/shared/Codes/scripts'
  if ! [ -r $SCRIPT ]
  then
    mkdir storage/shared/Codes/scripts
  fi

  echo '
██╗     ██████╗ ███╗   ██╗███████╗
██║     ██╔══██╗████╗  ██║╚══███╔╝
██║     ██████╔╝██╔██╗ ██║  ███╔╝
██║     ██╔══██╗██║╚██╗██║ ███╔╝
███████╗██║  ██║██║ ╚████║███████╗
╚══════╝╚═╝  ╚═╝╚═╝  ╚═══╝╚══════╝
  '
fi

alias v='nvim'
alias vim='nvim'
alias nvimrc='cd ~/.config/nvim/'
alias home='cd ~/storage/shared'
alias config='//data/data/com.termux/files/usr/bin/git --git-dir=/data/data/com.termux/files/home/.cfg/ --work-tree=/data/data/com.termux/files/home'
alias revise='apt update -y && apt upgrade -y'
alias sdcard='cd /storage/B056-729D'
alias py='python'
alias penv='pipenv'
alias resource='source ~/.bashrc'
alias m='python main.py'
alias r='python run.py'

alias tf='bash ~/.tmux/tmux-portal.sh'
alias ff='cd $(find ~/storage/shared/Codes/ ~/.config/nvim -type d -not -path "*/\.git*" | fzf)'
alias bruh='git add . && git commit -m "bruh" && git push'

MAIN='storage/shared'
if [ -d $MAIN ]
then
  cd storage/shared
fi

