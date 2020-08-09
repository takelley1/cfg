#!/usr/bin/env python
#
# Status bar script for printing the current amount of virtual RAM
#   available in gigabytes.
#
# Emoji U+1F9E0 🧠
# Font-Awesome f538 

import sys
import psutil


def main():
    ram = psutil.virtual_memory().available

    # Covert to GB.
    ram = ram / (1024 ** 3)

    ram = round(ram, 1)
    ram = str(ram)

    print('  ' + ram + 'G')

    sys.exit(0)


if __name__ == '__main__':
    main()
