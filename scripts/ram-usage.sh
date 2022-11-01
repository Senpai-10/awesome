#!/bin/sh

ram_usage=$(free -m | awk 'NR==2{printf "%.2f", $3*100/$2 }' | perl -nl -MPOSIX -e 'print floor($_)')

# in %
echo " $ram_usage%"
