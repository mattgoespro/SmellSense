#!/bin/bash

function pull_device_db_file {
    local local_db_file_path=$1

    device_db_file_path="/data/data/za.co.smellsense/databases/smellsense_database.db"

    if ! adb exec-out "$device_db_file_path" "$local_db_file_path"; then
        return 1
    fi

    return 0
}

function try_pull_device_db {
    if ! pull_device_db_file "$local_db_file_path"; then
        echo "[sync_db_from_device] WARNING: inital sync did not complete."
        exit 1
    fi

    return 0
}

function sync_device_db_to_project() {
    # open_device_shell

    local device_db_file_name="smellsense_database.db"
    local device_db_file_path="/data/data/za.co.smellsense/databases/$device_db_file_name"

    cwd="\"$(dirname "$0")\""
    local_db_file_dir="$cwd/temp"

    if [ ! -d "$local_db_file_dir" ]; then
        mkdir -p "$local_db_file_dir"
    fi

    local_db_file_path="$cwd/temp/$device_db_file_name"

    echo "[sync_db_from_device] Performing initial sync of device db '$device_db_file_path' -> '$local_db_file_path' ..."

    try_pull_device_db

    echo "[sync_db_from_device] Starting synchronization..."

    while true; do
        if ! try_pull_device_db; then
            echo "[sync_db_from_device] Retrying sync..."
            sleep 1
            continue
        fi

        sleep 5
    done
}

echo "[sync_db_from_device] Starting synchronization of device database to local database..."

sync_device_db_to_project

echo "[sync_db_from_device] Synchronization ended."

read -r -p "[connect_device] Press any key to exit..."

exit 0
