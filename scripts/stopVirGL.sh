#!/data/data/com.termux/files/usr/bin/bash

# Kill VirGL Render Test Server
echo "Stopping VirGL Server"
kill -9 $(pgrep -f "virgl_test_server") 2> /dev/null
kill -9 $(pgrep -f "virgl_test_server_android") 2> /dev/null