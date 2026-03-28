#!/data/data/com.termux/files/usr/bin/bash

# Kill PulseAudio
echo "Stopping PulseAudio"
kill -9 $(pgrep -f "pulseaudio") 2> /dev/null