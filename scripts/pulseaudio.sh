#!/data/data/com.termux/files/usr/bin/bash

# Install: pkg install pulseaudio

# PulseAudio
ps cax | grep pulseaudio
if [ $? -eq 0 ]; then
        echo "PulseAudio Server (pulseaudio) is already running."
else
        echo "PulseAudio (pulseaudio) is not running. Now starting."
        LD_PRELOAD=/system/lib64/libskcodec.so
        pulseaudio --start --load="module-native-protocol-tcp auth-ip-acl=127.0.0.1 auth-anonymous=1" --exit-idle-time=-1 &
fi