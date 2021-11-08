if [ -r 'storage/shared' ]
then

  CODE='storage/shared/Codes'
  if ! [ -r $CODE ]
  then
    mkdir storage/shared/Codes
  fi
  alias code='cd ~/storage/shared/Codes/'

  SCRIPT='storage/shared/Codes/scripts'
  if ! [ -r $SCRIPT ]
  then
    mkdir storage/shared/Codes/scripts 
  fi
  alias script='cd ~/storage/shared/Codes/scripts'

  echo '
██╗     ██████╗ ███╗   ██╗███████╗
██║     ██╔══██╗████╗  ██║╚══███╔╝
██║     ██████╔╝██╔██╗ ██║  ███╔╝
██║     ██╔══██╗██║╚██╗██║ ███╔╝
███████╗██║  ██║██║ ╚████║███████╗
╚══════╝╚═╝  ╚═╝╚═╝  ╚═══╝╚══════╝
  '
fi

alias nvimcr='cd $HOME/.config/nvim/'
alias home='cd ~/storage/shared'
alias config='//data/data/com.termux/files/usr/bin/git --git-dir=/data/data/com.termux/files/home/.cfg/ --work-tree=/data/data/com.termux/files/home'
alias revise='apt update && apt upgrade'
alias sdcard='cd /storage/B056-729D'

MAIN='storage/shared'
if [ -d $MAIN ]
then
  cd storage/shared
fi

