#!/bin/bash
echo '6' > /tmp/redshift-brightness

# kill any existing redshift processes
killall redshift-gtk


# set new redshift brightness
redshift-gtk -r -t 6500:3000 -b .6:.6 -l 39:-76 &

exit 0
