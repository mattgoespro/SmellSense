#!/bin/bash

function usage() {
    echo "Usage: connect_device.sh [-d <wifi|vm>]"
}

function connect_wireless_device() {
    # Ensure adb server is running
    adb start-server

    # Get the device ID of the single connected device
    DEVICE_ID="$(adb devices | grep -w "device" | cut -f1)"

    if [ -z "$DEVICE_ID" ]; then
        echo "No devices connected."
        return 0
    fi

    echo "Connecting to device over Wi-Fi..."

    ADB_PORT=5555

    # Retrieve the IP address of the connected device
    DEVICE_IP="$(adb -s "$DEVICE_ID" shell ip route | awk '{print $9}' | tail -n 1)"

    echo -e "Identified device:"
    echo "  ID: $DEVICE_ID"
    echo "  IP Address: $DEVICE_IP"

    echo "Enabling ADB over Wi-Fi on the device..."

    if ! adb -s "$DEVICE_ID" tcpip $ADB_PORT >>/dev/null; then
        echo "Failed to enable ADB over Wi-Fi on the device."
        return 1
    fi

    # Connect to the device over Wi-Fi
    echo "Connecting on address: $DEVICE_IP:$ADB_PORT"

    if ! adb connect "$DEVICE_IP:$ADB_PORT" >>/dev/null; then
        echo "Failed to connect to device. Ensure that:"
        echo "  - The device is connected to this machine via USB and has USB debugging enabled."
        echo "  - Wi-Fi on the device in turned on and connected to the same network."
        return 1
    fi

    # Verify the connection
    if adb devices | grep -q "$DEVICE_IP:$ADB_PORT"; then
        return 0
    fi

    return 1
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
            if ! connect_wireless_device; then
                echo "Failed to connect to device."
                exit 1
            fi
            ;;
        "vm")
            echo "Connecting to VM device..."
            exit 0
            ;;

        *)
            echo "Invalid option: $OPTARG"
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

exit 0
