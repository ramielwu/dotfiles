#!/bin/bash

DEVICE_NAME="Logitech Wireless Mouse"
PROPERTY="libinput Accel Speed"
VALUE="-0.5"

# Find the ID dynamically
ID=$(xinput list --id-only "$DEVICE_NAME" 2>/dev/null)

# Apply the property if the device is found
if [ -n "$ID" ]; then
    xinput set-prop "$ID" "$PROPERTY" "$VALUE"
fi
