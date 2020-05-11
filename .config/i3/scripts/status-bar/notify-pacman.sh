#!/bin/dash

# Status bar script to print a notification if a process called "0pacman" is running.
# This is to notify the user if the hourly cron pacman update job is running so they don't reboot while it's happening.

# Check if (1) the system uses pacman and (2) the pacman cron job is running.
[ -x "/usr/bin/pacman" ] && [ -n "$(pgrep '0pacman')" ] && printf "%s\n" "performing updates - DO NOT REBOOT"

exit 0