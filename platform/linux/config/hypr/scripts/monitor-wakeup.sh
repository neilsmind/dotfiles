#!/usr/bin/env sh

# This script runs after waking from suspend to ensure correct monitor configuration
# It gives the system time to update lid state before reconfiguring monitors

# Wait for system to stabilize after wake
sleep 1

# Get the Hyprland instance signature for the current user
HYPR_INSTANCE=$(ls -t /tmp/hypr/*/hyprland.log 2>/dev/null | head -1 | cut -d'/' -f4)

if [ -z "$HYPR_INSTANCE" ]; then
    exit 1
fi

export HYPRLAND_INSTANCE_SIGNATURE="$HYPR_INSTANCE"

# Trigger monitor reconfiguration
/home/neilsmind/.config/hypr/scripts/monitor-hotplug.sh
