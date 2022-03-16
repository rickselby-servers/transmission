#!/bin/sh
if [ -f /flexget/config/.config-lock ]; then
    rm /flexget/config/.config-lock
fi
flexget daemon start
