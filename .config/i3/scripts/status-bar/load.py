#!/bin/python

# Status bar script for printing the current system load, as seen in `top`.

# Emoji U+1F4CA 📈
# Font-Awesome f3fd 

import sys
import psutil

def main():
    load_tuple = psutil.getloadavg()
    load_list = []

    # Break apart the tuple in order to add leading zeroes to each number.
    for load in load_tuple:
        load = "{:05.2f}".format(load)
        # Reassemble the values into a list.
        load_list.append(load)

    # Convert the list into a string and remove unnecessary characters.
    load_list = str(load_list)
    load_list = load_list.replace('[','').replace(']','').replace("'","")

    print('', load_list)

    sys.exit(0)

if __name__ == '__main__':
    main()
