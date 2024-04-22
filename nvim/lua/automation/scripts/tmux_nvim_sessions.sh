#!/bin/bash

session_name=$(tmux display-message -p '#S')

windows=$(tmux list-windows -t "$session_name" -F "#I")

vim_panes=0

for window_id in $windows; do
    panes=$(tmux list-panes -t "$session_name:$window_id" -F "#P")
    for pane_id in $panes; do
        command=$(tmux display-message -p -t "$session_name:$window_id.$pane_id" '#{pane_current_command}')
        if [[ $command == "nvim" ]]; then
            vim_panes=$((vim_panes + 1))
        fi
    done
done

echo $vim_panes
