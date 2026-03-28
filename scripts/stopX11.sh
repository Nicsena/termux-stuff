#!/data/data/com.termux/files/usr/bin/bash
X11_LOCK_FILE="$PREFIX/tmp/.X0-lock"

# Kill Termux X11 (com.termux.x11)
echo "Stopping Termux X11"
kill -9 $(pgrep -f "com.termux.x11") 2> /dev/null

# Kill x11vnc
echo "Stopping X11VNC"
kill -9 $(pgrep -f "x11vnc") 2> /dev/null

# Kill VirGL Render Test Server
echo "Stopping VirGL Server if it is running"
kill -9 $(pgrep -f "virgl_test_server") 2> /dev/null
kill -9 $(pgrep -f "virgl_test_server_android") 2> /dev/null

if [[ -f "$X11_LOCK_FILE" ]]; then
    echo "Removing existing lock file: $X11_LOCK_FILE"
    rm -rf "$X11_LOCK_FILE"
else
    echo "No lock file found at $X11_LOCK_FILE"
fi