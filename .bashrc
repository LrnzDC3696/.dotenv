
echo '
██╗     ██████╗ ███╗   ██╗███████╗
██║     ██╔══██╗████╗  ██║╚══███╔╝
██║     ██████╔╝██╔██╗ ██║  ███╔╝
██║     ██╔══██╗██║╚██╗██║ ███╔╝
███████╗██║  ██║██║ ╚████║███████╗
╚══════╝╚═╝  ╚═╝╚═╝  ╚═══╝╚══════╝
'

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


alias config='//data/data/com.termux/files/usr/bin/git --git-dir=/data/data/com.termux/files/home/.cfg/ --work-tree=/data/data/com.termux/files/home'
alias revise='apt update && apt upgrade'


MAIN='storage/shared'
if [ -d $MAIN ]
then
  cd storage/shared
fi

