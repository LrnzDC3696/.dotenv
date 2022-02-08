#!/data/data/com.termux/files/usr/bin bash


# 1. ASK FOR THE DIRECTORY TO BE USED  ----------------------------------------------- #

# If the directory is given then use it; else fzf to select the directory
if [[ $# -eq 1 ]]; then
    selected=$1
else
    selected=$(find ~/storage/shared/Codes ~/.config/nvim -type d -not -path '*/\.git*' | fzf)
fi

# If nothing is selected; then exit
if [[ -z $selected ]]; then
    exit 0
fi

selected_name=$(basename "$selected" | tr . _)  # Take the basename and replace . with _
tmux_running=$(pgrep tmux)  # Check if tmux is running


# 2. CREATE A NEW SESSION WITH THE NAME OF THE DIRECTORY  ---------------------------- #

# If tmux is dead; then start a new session
if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
    tmux new-session -s $selected_name -c $selected
    echo "exited"
    exit 0
fi

# If tmux has a session with the same name; then switch to it
if ! tmux has-session -t $selected_name 2> /dev/null; then
    tmux new-session -d -s $selected_name -c $selected 'pipenv shell'
    echo "Tmux: Created new tmux session $selected_name"
fi


# 3. CREATE NECESSARY WINDOWS FOR THE SESSION ---------------------------------------- #

tmux neww -t $selected_name:1 -n 'editor' -d 'pipenv shell'
tmux neww -t $selected_name:2 -n 'shell' -d 'pipenv shell'


# 4. SWITCH TO THE SESSION ----------------------------------------------------------- #
tmux switch-client -t $selected_name


# ------------------------------------------------------------------------------------ #

# PARAMETER IDEAS:
# Not gonna be implemented unless I needed it lol
# - go to tmux session -ng (no go)
# - setup the window -ns (no setup)
# - check if to not execute pipenv -np (pipenv)
