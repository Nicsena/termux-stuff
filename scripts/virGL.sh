#!/data/data/com.termux/files/usr/bin/bash

# Check if VirGL Test Server is running or not.
ps cax | grep virgl_test_server
if [ $? -eq 0 ]; then
        echo "VirGL Test Server (virgl_test_server) is already running."
else
        echo "VirGL Test Server (virgl_test_server) is not running. Now starting."
        #virgl_test_server --use-egl-surfaceless --use-gles &
        #virgl_test_server_android --angle-gl &
        virgl_test_server_android &
fi