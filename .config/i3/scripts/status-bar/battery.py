#!/usr/bin/env python
#
# Print battery percentage and estimated time remaining to full charge or
#   depletion.

import psutil
import os
import sys

# Convert seconds to HH:mm format.
def secs2hours(secs):
    mm, ss = divmod(secs, 60)
    hh, mm = divmod(mm, 60)
    return '%02d:%02d' % (hh, mm)

def main():
    # Get battery information.
    batt = psutil.sensors_battery()

    # Exit quietly if no battery is present.
    if not hasattr(batt, 'percent'):
        sys.exit(0)

    # Round remaining percent to nearest whole number.
    percent = round(batt.percent)

    # Convert remaining time to hours and minutes.
    remaining = secs2hours(batt.secsleft)
    # Format remaining time with parentheses.
    remaining = str(remaining)
    remaining = '(' + remaining + ')'

    # Indicate when the battery is being charged.
    if batt.power_plugged == True:
        plug = ''
    else:
        plug=''

    # This remaining time is caused by a full battery and is likely
    #   a bug, so don't print anything.
    if remaining == '(-1:59)':
        remaining = ''

    if percent >= 99:
        output='  FULL'
    else:
        output=' ' + str(percent) + '% ' + remaining + plug

    print(output)

    sys.exit(0)

if __name__ == '__main__':
    main()
