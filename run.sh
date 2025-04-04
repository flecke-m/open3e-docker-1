#!/bin/sh


echo "[INFO] Preparing to start...checking for devices.json"

if ! test -f /open3e/devices.json; then
    # Read the config file
    config_file="/open3e/args"
    CAN=""

    # Read the file and check for --can
    while IFS= read -r line; do
      if [[ "$line" == *"--can"* ]]; then
       # Read the next line into a variable
       IFS= read -r CAN
       break  # Exit after finding --can
      fi
    done < "$config_file"

    echo "[INFO] Running open3e_depictSystem -c $CAN ... This may take a while"
    cd /open3e
    open3e_depictSystem -c $CAN
fi

cd /open3e
echo "[INFO] Starting Open3e... "
open3e @args
