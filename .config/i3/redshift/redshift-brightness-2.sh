#!/bin/bash
echo '2' > /tmp/redshift-brightness

# kill any existing redshift processes
killall redshift-gtk


# set new redshift brightness
redshift-gtk -r -t 6500:3000 -b .2:.2 -l 39:-76 &

exit 0
