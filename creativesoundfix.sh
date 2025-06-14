#!/bin/bash

# ==============================================================================
# Creative Audio Surgical Restarter - Automated Edition
#
# This script periodically kills only the core audio engine plugin.
# The macOS launchd service automatically restarts it almost instantly,
# providing a fast, low-disruption fix for frequent audio crackling.
# ==============================================================================

# The name of the core audio engine to be surgically restarted.
# Do not change this.
PLUGIN_PROCESS_NAME="AudioServerDriverPlugin.app"

# --- Main Execution Loop ---

echo "--- Starting Creative Surgical Audio Restarter ---"
echo "The core audio plugin will be reset every 30 to 60 seconds (randomized)."
echo "Audio interruption will be minimal."
echo "Press Control+C to stop this script."

# Loop forever
while true; do
    # Randomize interval between 30 and 60 seconds
    RESTART_INTERVAL_SECONDS=$((RANDOM % 241 + 60))

    echo "----------------------------------------"
    echo "Waiting for ${RESTART_INTERVAL_SECONDS} seconds until next reset..."
    sleep "$RESTART_INTERVAL_SECONDS"
    
    echo "Performing surgical reset at $(date)..."
    # Kill the plugin. macOS launchd will restart it automatically.
    pkill -f "$PLUGIN_PROCESS_NAME"
    
    if [ $? -eq 0 ]; then
        echo "Successfully sent termination signal to '${PLUGIN_PROCESS_NAME}'."
        echo "macOS will now restart it automatically."
    else
        echo "Warning: Process '${PLUGIN_PROCESS_NAME}' not found. It may not have been running."
    fi
done
