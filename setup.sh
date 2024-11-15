#!/bin/bash
echo "Setting up project..."

{
    echo "Validating Flutter installation..."
    flutter doctor -v

    echo "Setting configuration for Android project..."
    flutter config --enable-android

    echo "Installing Flutter dependencies..."
    flutter pub get
} || {
    echo "An error occurred while setting up the project."
    exit 1
}

echo "Configuring adb..."
{
    adb kill-server
    adb start-server
} ||
    {
        echo "An error occurred while configuring adb."
        exit 1
    }

echo -e "\nSetup complete."

exit 0
