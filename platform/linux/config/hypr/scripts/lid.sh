#!/usr/bin/env sh

# Name of your internal laptop display (Find this using 'hyprctl monitors')
INTERNAL_MONITOR="eDP-1"

# Get the directory where this script is located
SCRIPT_DIR="$(cd "$(dirname "$0")" && pwd)"

# Check for external monitor connection (e.g., DP or HDMI)
# Adjust the regex 'DP-|HDMI-' to match your external monitor's naming convention
if hyprctl monitors | grep -q -e '^Monitor DP-' -e '^Monitor HDMI-'; then
    # External monitor is connected

    if [ "$1" = "close" ]; then
        # Lid closed: Disable internal monitor for clamshell mode
        hyprctl keyword monitor "$INTERNAL_MONITOR, disable"
    elif [ "$1" = "open" ]; then
        # Lid opened: Enable internal monitor
        # Replace the resolution/position/scale with your specific internal monitor config
        # Example: hyprctl keyword monitor "eDP-1, 1920x1080, 0x1080, 1"
        hyprctl keyword monitor "$INTERNAL_MONITOR, preferred, auto-left, 1"
    fi
else
    # NO external monitor is connected

    if [ "$1" = "close" ]; then
        # Suspend the system when closing the lid on battery/no external monitor
        systemctl suspend
    elif [ "$1" = "open" ]; then
        # Resume the system when opening the lid - ensure internal monitor is active
        hyprctl keyword monitor "$INTERNAL_MONITOR, preferred, auto, 1"
        hyprctl dispatch dpms on
    fi
fi

# Trigger monitor hotplug script to ensure correct configuration
"$SCRIPT_DIR/monitor-hotplug.sh" &
