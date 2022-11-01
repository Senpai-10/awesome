#!/bin/env bash

TempCat=$(cat /sys/class/thermal/thermal_zone0/temp)
Temp=${TempCat:: -3}

# temp is in °C
echo " $Temp%"
