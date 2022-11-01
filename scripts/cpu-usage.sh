#!/bin/sh

cpu_usage=$(top -b -n1 | grep "Cpu(s)" | awk '{print $2 + $4}' | perl -nl -MPOSIX -e 'print floor($_)')

echo " $cpu_usage%"
