
echo '
██╗     ██████╗ ███╗   ██╗███████╗
██║     ██╔══██╗████╗  ██║╚══███╔╝
██║     ██████╔╝██╔██╗ ██║  ███╔╝
██║     ██╔══██╗██║╚██╗██║ ███╔╝
███████╗██║  ██║██║ ╚████║███████╗
╚══════╝╚═╝  ╚═╝╚═╝  ╚═══╝╚══════╝
'

MAIN='storage/shared'
if [ -d $MAIN ]
then
  cd storage/shared
fi

alias code='cd ~/storage/shared/Codes/'
alias script='cd ~/storage/shared/Codes/scripts'
alias config='//data/data/com.termux/files/usr/bin/git --git-dir=/data/data/com.termux/files/home/.cfg/ --work-tree=/data/data/com.termux/files/home'

