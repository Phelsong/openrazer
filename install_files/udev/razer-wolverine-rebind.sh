#!/bin/bash
# Rebind Razer Wolverine devices from xpad to razerwolverine

DEVICE_INTERFACE="$1"

if [ -z "$DEVICE_INTERFACE" ]; then
    exit 1
fi

# Wait a moment for xpad to finish binding
sleep 0.5

# Unbind from xpad if bound
if [ -e "/sys/bus/usb/drivers/xpad/$DEVICE_INTERFACE" ]; then
    echo "$DEVICE_INTERFACE" > /sys/bus/usb/drivers/xpad/unbind 2>/dev/null
fi

# Bind to razerwolverine
echo "$DEVICE_INTERFACE" > /sys/bus/usb/drivers/razerwolverine/bind 2>/dev/null

exit 0
