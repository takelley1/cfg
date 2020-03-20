#!/bin/bash

# Status bar script for printing the "wa" field, as seen in the `top` command to get I/O use estimate.

# Emoji U+1F4BD 💽
# Font-Awesome f252 

io_wa=$(top -b | head -3 | awk '{print $10}' | tail -1)

# Show Font-Awesome icons on Arch-based distros, use text everywhere else.
[[ -x "/usr/bin/pacman" ]] && printf "%s\n" " ${io_wa}" || printf "%s\n" "WA ${io_wa}"

exit 0
