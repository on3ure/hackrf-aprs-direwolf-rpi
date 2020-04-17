#!/bin/bash

/usr/local/bin/rx_fm -M fm -f 28.800M -s 24000 - | /usr/local/bin/direwolf -c /aprs/sdr-1200bps.conf -l /var/log/direwolf.log -r 24000 -D 1 -B 1200 - >/dev/tty3
