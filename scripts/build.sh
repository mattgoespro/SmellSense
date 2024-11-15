#!/bin/bash

echo "[build] Cleaning and rebuilding project..."

flutter clean || {
    echo -e "\n[build] Error: failed to clean project."
    exit 1>>/dev/null
}

flutter pub get || {
    echo -e "\n[build] Error: failed to get dependencies."
    exit 1>>/dev/null
}

flutter pub run flutter_launcher_icons:main -f .config/flutter_launcher_icons.yaml || {
    echo -e "\n[build] Error: failed to generate launcher icons."
    echo -e "\n\nBuild failed."
    exit 1>>/dev/null
}

./scripts/generate_db.sh || {
    echo -e "\n\n[build] Error: build failed."
    exit 1>>/dev/null
}

echo -e "\n[build] Success."

exit 0 >>/dev/null
