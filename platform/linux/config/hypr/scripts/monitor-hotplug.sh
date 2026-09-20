#!/usr/bin/env sh

# Monitor hotplug detection script for Hyprland
# This script watches for monitor connection/disconnection events
# and automatically reconfigures displays based on lid state

INTERNAL_MONITOR="eDP-1"
LOG_FILE="/tmp/hyprland-monitor-hotplug.log"

# Logging function
log() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $*" >> "$LOG_FILE"
}

# Function to check if external monitor is connected
has_external_monitor() {
    hyprctl monitors | grep -q -e '^Monitor DP-' -e '^Monitor HDMI-'
}

# Function to check if lid is closed
is_lid_closed() {
    local lid_state=""

    # Check LID0 first (most common)
    if [ -f /proc/acpi/button/lid/LID0/state ]; then
        lid_state=$(cat /proc/acpi/button/lid/LID0/state | awk '{print $2}')
    elif [ -f /proc/acpi/button/lid/LID/state ]; then
        lid_state=$(cat /proc/acpi/button/lid/LID/state | awk '{print $2}')
    fi

    log "Lid state: $lid_state"

    [ "$lid_state" = "closed" ]
}

# Function to configure monitors
configure_monitors() {
    local has_external=$(has_external_monitor && echo "yes" || echo "no")
    local lid_closed=$(is_lid_closed && echo "yes" || echo "no")

    log "Configure monitors - External: $has_external, Lid closed: $lid_closed"

    if [ "$has_external" = "yes" ] && [ "$lid_closed" = "yes" ]; then
        # External monitor connected + lid closed = clamshell mode
        log "Action: Clamshell mode - disabling internal monitor"
        hyprctl keyword monitor "$INTERNAL_MONITOR, disable"
    elif [ "$has_external" = "yes" ] && [ "$lid_closed" = "no" ]; then
        # External monitor connected + lid open = both displays
        log "Action: Dual display mode - enabling both monitors"
        hyprctl keyword monitor "$INTERNAL_MONITOR, preferred, auto-left, 1"
    elif [ "$has_external" = "no" ] && [ "$lid_closed" = "no" ]; then
        # No external monitor + lid open = internal display only
        log "Action: Internal display only"
        hyprctl keyword monitor "$INTERNAL_MONITOR, preferred, auto, 1"
    fi
    # If no external and lid closed, system should be suspended (handled by lid.sh)
}

# If called with "daemon" argument, run as a background daemon
if [ "$1" = "daemon" ]; then
    # Initial configuration on startup
    configure_monitors

    # Watch for monitor events using socat to listen to Hyprland socket
    socat -U - "UNIX-CONNECT:/tmp/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock" | while read -r line; do
        # Monitor events: monitoradded or monitorremoved
        if echo "$line" | grep -q -e "monitoradded" -e "monitorremoved"; then
            # Small delay to let monitor settle
            sleep 0.5
            configure_monitors
        fi
    done
else
    # Run once for manual triggering
    configure_monitors
fi
