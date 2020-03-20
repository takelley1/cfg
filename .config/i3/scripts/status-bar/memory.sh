#!/bin/bash

# Status bar script for printing the current amount of RAM remaining in gigabits.

# Emoji U+1F9E0 🧠
# Font-Awesome f538 

ram_free=$(free -h | awk '{print $7}' | sed -n 2p | tr -d 'i')

# Show Font-Awesome icons on Arch-based distros, use text everywhere else.
[[ -x "/usr/bin/pacman" ]] && printf "%s\n" "  ${ram_free}" || printf "%s\n" "FREE ${ram_free}"

exit 0
