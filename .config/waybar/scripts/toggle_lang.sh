#!/bin/bash

# Get the current keyboard layout
current_layout=$(setxkbmap -query | grep layout | awk '{print $2}')

# If the current layout is "us" (English), change to Russian (RU)
if [ "$current_layout" == "us" ]; then
    export LANG=ru_RU.UTF-8
    export LC_ALL=ru_RU.UTF-8
    setxkbmap ru
# If the current layout is "ru" (Russian), change to English (US)
else
    export LANG=en_US.UTF-8
    export LC_ALL=en_US.UTF-8
    setxkbmap us
fi

# Apply the changes to the locale
source /etc/default/locale

