#!/bin/bash

# Path to the Creative application executable
APP_PATH="/Applications/Creative.app/Contents/MacOS/Creative"

# Check if the application exists
if [ ! -f "$APP_PATH" ]; then
    echo "Error: Application not found at $APP_PATH"
    exit 1
fi

# Infinite loop to launch the app every 3 minutes or 180 seconds
while true; do
    # Kill any existing instances of Creative
    pkill -f "$APP_PATH"
    echo "Launching Creative at $(date)"
    "$APP_PATH" &
    sleep 180
done
