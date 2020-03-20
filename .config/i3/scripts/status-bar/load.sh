#!/bin/bash

# Status bar script for printing the current system load, as seen in `top`.

# Emoji U+1F4CA 📈
# Font-Awesome f3fd  

load=$(cat /proc/loadavg | awk '{print $1,$2,$3}')

# Show Font-Awesome icons on Arch-based distros, use text everywhere else.
if [[ -x "/usr/bin/pacman" ]]; then
    printf "%s\n" " ${load}"
else
    printf "%s\n" "LOAD ${load}"
fi

exit 0
