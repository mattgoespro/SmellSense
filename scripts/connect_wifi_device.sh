#!/bin/bash

##
# Connects an Android device to the host machine over Wi-Fi.
##

function configure_adb_over_wifi() {
    local connection_port="$1"

    if ! adb tcpip "$connection_port"; then
        echo "[connect_device] Error: failed to start TCP-IP service on port '$connection_port'."
        return 1
    fi

    return 0
}

function connect_wireless_device() {
    local ADB_PORT=5555

    if ! configure_adb_over_wifi $ADB_PORT; then
        echo "[connect_device] Error: failed to configure adb over Wi-Fi."
        return 1
    fi

    # Wait until the connection has reset
    sleep 3

    local DEVICE_IP
    DEVICE_IP="$(adb shell ip addr show wlan0 | grep "inet" | awk '{print $2}' | cut -d'/' -f1 | head -n 1)"

    if [ -z "$DEVICE_IP" ]; then
        echo -e "\n[connect_device] Error: failed to resolve device IP address. Ensure that Wi-Fi on the device is enabled and connected to the same wireless network as the host."
        return 1
    fi

    echo -e "[connect_device] Identified device with IP address: '${DEVICE_IP}'"

    echo "[connect_device] Connecting to device..."

    connect_output=$(adb connect "$DEVICE_IP:$ADB_PORT")

    if echo "$connect_output" | grep -q "cannot connect to"; then
        echo -e "\n[connect_device] Error: connection failed."
        echo "Possible reasons:"
        echo "  - USB debugging has not been enabled on the device."
        echo "  - Wi-Fi is disabled on the device."
        echo "  - The device is not connected to the same network as the host."
        return 1
    fi

    echo -e "[connect_device] Connected to device: '${DEVICE_IP}:${ADB_PORT}'"
    echo "[connect_device] The device can safely be disconnected from the USB cable."

    return 0
}

if adb forward --list | grep -q "tcp:"; then
    echo "[connect_device] Device already connected."
    exit 0
fi

if ! connect_wireless_device; then
    echo -e "\n[connect_device] Failed."
    exit 1
fi

echo -e "\n[connect_device] Success."

exit 0
