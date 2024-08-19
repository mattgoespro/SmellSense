#!/bin/bash

function sync_pull_db {
    local local_db_file_path=$1

    device_db_file_path="/data/data/za.co.smellsense/databases/smellsense_database.db"

    if ! adb pull "$device_db_file_path" "$local_db_file_path"; then
        echo "failed to pull database file from device."
        return 1
    fi

    return 0
}

function sync_db_from_device() {
    local device_db_file_name="smellsense_database.db"
    local device_db_file_path="/data/data/za.co.smellsense/databases/$device_db_file_name"

    cwd="$(pwd)"

    local_db_file_path="$cwd/temp/$device_db_file_name"

    echo "performing initial sync of device db '$device_db_file_path' -> '$local_db_file_path' ..."

    if ! sync_pull_db "$local_db_file_path"; then
        echo "failed to sync database file:"
        echo -e "\tdevice path: $device_db_file_path"
        echo -e "\tlocal path: $local_db_file_path"
        return 1
    fi

    echo "starting synchronization..."

    while true; do
        if ! sync_pull_db "$local_db_file_path"; then
            echo "failed to sync database file:"
            echo -e "\tdevice path: $device_db_file_path"
            echo -e "\tlocal path: $local_db_file_path"
            return 1
        fi

        sleep 5
    done
}

echo "starting synchronization of device database to local database..."

sync_db_from_device

exit 0
