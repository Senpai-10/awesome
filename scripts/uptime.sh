#!/bin/sh

uptime=$(cat /proc/uptime | perl -ne '/(\d*)/ ; printf "%02d:%02d:%02d:%02d\n",int($1/86400),int(($1%86400)/3600),int(($1%3600)/60),$1%60')

echo "神 $uptime"
