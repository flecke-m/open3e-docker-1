#!/bin/bash


echo "[INFO] Preparing to start...checking for devices.json"

if ! test -f /data/devices.json; then
    # Read the config file
    config_file="/data/args"
    while IFS= read -r line; do
        case "$line" in
            --can)
                read -r CAN  # Read the next line for the value
                ;;
            *)
                echo "Unknown option: $line"
                ;;
        esac
    done < "$config_file"

    echo "[INFO] Running open3e_depictSystem -c $CAN ... This may take a while"
    cd /data
    open3e_depictSystem -c $CAN
fi

cd /data
echo "[INFO] Starting Open3e... "
open3e @args
