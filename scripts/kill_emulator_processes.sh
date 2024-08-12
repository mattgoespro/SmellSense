#!/bin/bash

#!/bin/bash

# List of process names to be killed
processes=("emulator" "adb" "qemu" "openjdk" "java" "gradle")

# Loop through each process and kill it using taskkill
for process in "${processes[@]}"; do
    echo "Killing process: $process"
    taskkill //IM "$process.exe" //F
done

echo "All specified processes have been killed."
