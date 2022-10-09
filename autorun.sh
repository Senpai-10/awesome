#!/usr/bin/env bash

function run {
    (ps -AL | grep -i cmus-rpc) || ${@:2} &
    #if ! pgrep $1 ; then
    #    ${@:2}&
    #fi
}

run picom       picom
run nitrogen    nitrogen --restore
run imwheel     imwheel -b 45
run flameshot   flameshot
run gromit-mpx  gromit-mpx
run Discord     discord --start-minimized
run qpwgraph    qpwgraph ~/patchbay.qpwgraph -am

kill $(ps -AL | grep -i discover-overla | awk '{print $2}') ; discover-overlay &
