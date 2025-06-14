#!/bin/bash

# ==============================================================================
# Creative Audio Surgical Restarter - Automated Edition
#
# This script periodically kills only the core audio engine plugin.
# The macOS launchd service automatically restarts it almost instantly,
# providing a fast, low-disruption fix for frequent audio crackling.
# ==============================================================================

# --- CONFIGURATION ---

# SET THE RESTART INTERVAL HERE (in seconds).
# This can be much shorter now because the reset is very fast.
# 60 = 1 minute
# 120 = 2 minutes
# 180 = 3 minutes
RESTART_INTERVAL_SECONDS=60

# The name of the core audio engine to be surgically restarted.
# Do not change this.
PLUGIN_PROCESS_NAME="AudioServerDriverPlugin.app"

# --- Main Execution Loop ---

echo "--- Starting Creative Surgical Audio Restarter ---"
echo "The core audio plugin will be reset every ${RESTART_INTERVAL_SECONDS} seconds."
echo "Audio interruption will be minimal."
echo "Press Control+C to stop this script."

# Loop forever
while true; do
    echo "----------------------------------------"
    echo "Waiting for ${RESTART_INTERVAL_SECONDS} seconds until next reset..."
    sleep "$RESTART_INTERVAL_SECONDS"
    
    echo "Performing surgical reset at $(date)..."
    # Kill the plugin. macOS launchd will restart it automatically.
    pkill -f "$PLUGIN_PROCESS_NAME"
    
    # Check if it was killed successfully (optional, good for logging)
    # The `if` statement checks the exit code of pkill. 0 = success.
    if [ $? -eq 0 ]; then
        echo "Successfully sent termination signal to '${PLUGIN_PROCESS_NAME}'."
        echo "macOS will now restart it automatically."
    else
        # This will happen if the plugin wasn't running for some reason.
        echo "Warning: Process '${PLUGIN_PROCESS_NAME}' not found. It may not have been running."
    fi
done
