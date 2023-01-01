#!/bin/sh

# ram_prec=$(free -m | awk 'NR==2{printf "%.2f", $3*100/$2 }' | perl -nl -MPOSIX -e 'print floor($_)')
ram_total="$(free -h | gawk  '/Mem:/{print $2}')"
ram_used="$(free -h | gawk  '/Mem:/{print $3}')"
ram_available="$(free -h | gawk  '/Mem:/{print $7}')"

echo " $ram_used / $ram_total | $ram_available"
