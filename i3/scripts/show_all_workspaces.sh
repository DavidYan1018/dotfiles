#!/usr/bin/env bash

MAX_DESKTOPS=4  # Set the number of workspaces you want to display

# Get the list of currently active workspaces
ACTIVE_WORKSPACES=$(i3-msg -t get_workspaces | grep -o '"num":[0-9]' | grep -o '[0-9]\+')

# Iterate through all possible workspaces from 1 to MAX_DESKTOPS
for i in $(seq 1 $MAX_DESKTOPS); do
    if echo "$ACTIVE_WORKSPACES" | grep -q "^$i$"; then
        # Mark the active workspace with an asterisk (*)
        echo -n "$i* "
    else
        # Display the inactive workspace
        echo -n "$i "
    fi
done

echo

