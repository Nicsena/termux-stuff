#!/data/data/com.termux/files/usr/bin/bash

# Install: pkg install mesa mesa-demos mesa-vulkan-icd-freedreno vulkan-tools

export DISPLAY=:0
export PULSE_SERVER=127.0.0.1
export vblank_mode=0

# Important to be set first.
export XDG_RUNTIME_DIR=$TMPDIR

DISPLAY_ENVIRONMENT=xfce

# ==============================================

# === GPU ===
# llvmpipe, virpipe, or zink
DRIVER_NAME=zink
export GALLIUM_DRIVER=$DRIVER_NAME
export MESA_LOADER_DRIVER_OVERRIDE=$DRIVER_NAME

# 4.0 or 4.3COMPAT
#export MESA_GL_VERSION_OVERRIDE=4.3COMPAT
#export MESA_GLES_VERSION_OVERRIDE=3.2
#export MESA_NO_ERROR=1

export ZINK_DESCRIPTORS=lazy

# ===============================================


# Kill Termux X11
X11_LOCK_FILE="$PREFIX/tmp/.X0-lock"

kill -9 $(pgrep -f "termux.x11") 2> /dev/null
kill -9 $(pgrep -f "x11vnc") 2> /dev/null

if [[ -f "$X11_LOCK_FILE" ]]; then
    echo "Removing existing lock file: $X11_LOCK_FILE"
    rm -rf "$X11_LOCK_FILE"
else
    echo "No lock file found at $X11_LOCK_FILE"
fi


# Start termux x11
echo "Starting Termux X11"
termux-x11 :0 &

sleep 1

#Start VNC
x11vnc -display :0 -forever -shared -desktop "Termux-$(hostname)-X11" &

sleep 1

# Start Desktop Environment
if [[ "$DESKTOP_ENVIRONMENT" == "xfce" ]]; then
        echo "Starting XFCE4 Destkop Environment"
        dbus-launch --exit-with-session xfce4-session
elif [[ "$DESKTOP_ENVIRONMENT" == "prism" ]]; then
        echo "Starting Prism Desktop Environment"
else
        echo "Starting No Desktop Environment. Vaild Options: xfce or prism"
fi

# Kill x11
#sleep 1
#pkill -f $(pgrep -f "com.termux.x11") 2> /dev/null
#pkill -f $(pgrep -f "x11vnc") 2> /dev/null