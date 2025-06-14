# Creative Labs Crackling X1 Fix

This project provides a simple shell script to automatically fix frequent audio crackling issues with Creative Labs audio devices on macOS. The script periodically restarts the core audio engine plugin, which is quickly relaunched by macOS, minimizing audio interruption.

## How It Works

- The script kills the `AudioServerDriverPlugin.app` process at a configurable interval.
- macOS automatically restarts the plugin, clearing up audio crackling without requiring a full system reboot or audio device replug.

## Usage

1. **Open Terminal** and navigate to this directory:
   ```sh
   cd /workspaces/Creative-Labs-Crackling-X1-Fix
   ```

2. **Make the script executable** (if not already):
   ```sh
   chmod +x creativesoundfix.sh
   ```

3. **Run the script**:
   ```sh
   ./creativesoundfix.sh
   ```

   - The script will run indefinitely, resetting the audio plugin at the configured interval.
   - Press `Control+C` to stop.

## Configuration

- Open `creativesoundfix.sh` in a text editor.
- Change the value of `RESTART_INTERVAL_SECONDS` to set how often the plugin is restarted (in seconds).
  - Example: `RESTART_INTERVAL_SECONDS=120` (every 2 minutes)

## Notes

- This script is intended for macOS systems using Creative Labs audio devices.
- Minimal audio interruption is expected during each reset.
- No system reboot or device replug is required.

## Disclaimer

Use at your own risk. This script is provided as-is and may not work for all systems or configurations.
