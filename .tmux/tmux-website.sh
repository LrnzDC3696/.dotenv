#!/data/data/com.termux/files/usr/bin bash

# Creating a session
tmux new -s website -n editor -d
echo "Tmux: Session 'website' Created"

# Default
go_to_tmux="True"
setup_window="True"

# Unpacking the params
while [ "$#" -gt 0 ]; do
    curr=$1
    shift

    case "$curr" in
    "-ns") # No setup
        setup_window="False"
        ;;
    "-ng") # No go
        go_to_tmux="False"
        ;;
    *) echo "Unavailable command... $curr"
    esac
done


# Checks

if [ $setup_window == "True" ]; then
    tmux neww -t website: -n shell -d 'cd ~/storage/shared/Codes/website && pipenv shell'
else
    echo "Tmux Website: window setup skipped"
fi

if [ $go_to_tmux == "True" ]; then
    tmux a -t website
else
    echo "Tmux Website: jobs done"
fi
