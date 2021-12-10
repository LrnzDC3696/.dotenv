#!/data/data/com.termux/files/usr/bin bash

if [[ $# -eq 1 ]]; then
    selected=$1
else
    selected=$(find ~/storage/shared/Codes ~/.config/nvim -mindepth 1 -maxdepth 1 -type d | fzf)
fi

if [[ -z $selected ]]; then
    exit 0
fi

selected_name=$(basename "$selected" | tr . _)
tmux_running=$(pgrep tmux)

if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
    tmux new-session -s $selected_name -c $selected
    exit 0
fi
echo 21
if ! tmux has-session -t $selected_name 2> /dev/null; then
    tmux new-session -ds $selected_name -c $selected
fi
echo 12
tmux switch-client -t $selected_name

