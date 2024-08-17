#!/bin/bash

##
# Connects an Android device to the host machine over Wi-Fi.
# The script should be executed from an external script or terminal.
##

function usage() {
    echo "Usage: connect_device.sh [-d <wifi|vm>]"
}

function connect_wireless_device() {
    # Get the device ID of the single connected device
    mapfile -t devices < <(adb devices | grep -w "device" | awk '{print $1}')
    DEVICE_ID="${devices[0]}"
    DEVICE_IP="$(adb shell ip route | awk '{print $9}' | tail -n 1)"

    if [ -z "$DEVICE_ID" ] || [ -z "$DEVICE_IP" ]; then
        echo "error: no devices connected."
        return 1
    fi

    ADB_PORT="${DEVICE_IP##*:}"

    echo -e "identified device '${DEVICE_ID}'"

    echo "connecting to device over wi-fi."

    # ADB_PORT=5555

    # if ! adb -s "$DEVICE_ID" tcpip "$ADB_PORT" >>/dev/null; then
    #     echo "error: adb failed to bridge connection to device '$DEVICE_ID' over wi-fi."
    #     return 1
    # fi

    echo "enabled adb over wi-fi for the connected device..."

    # Connect to the device over Wi-Fi

    if ! adb connect "$ADB_PORT" >>/dev/null; then
        echo "error: failed to connect to device."
        echo "Ensure that:"
        echo "  - The device is connected to this machine via USB and has USB debugging enabled."
        echo "  - Wi-Fi on the device in turned on and connected to the same network."
        return 1
    fi

    echo "connection complete"

    return 0
}

while getopts "d:" opt; do
    case "${opt}" in
    d)
        if [ -z "$OPTARG" ]; then
            usage
            exit 1
        fi

        case "$OPTARG" in
        "wifi")
            if adb forward --list | grep -q "tcp:"; then
                echo "device already connected."
                return
            fi

            if ! connect_wireless_device; then
                exit 1
            fi

            echo -e "\nsuccess: device connected."
            ;;
        "vm")
            echo "connecting to VM device..."
            exit 0
            ;;

        *)
            echo "invalid option: $OPTARG"
            usage
            exit 1
            ;;
        esac
        ;;
    \?)
        usage
        ;;
    *)
        usage
        ;;
    esac
done

read -r -p "Press any key to exit..."

