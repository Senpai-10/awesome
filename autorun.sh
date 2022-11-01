#!/usr/bin/env bash

run() {
    if ! pgrep "$1" > /dev/null ;
    then
        "${@:2}"&
    fi
}

run_or_restart() {
    notify-send "Awesome autorun" "Restarting $1"
    killall "$1"

    "${@:2}"&
}

run picom           picom
run nitrogen        nitrogen --restore
run imwheel         imwheel -b 45
run flameshot       flameshot
run gromit-mpx      gromit-mpx
run Discord         discord --start-minimized
run qpwgraph        qpwgraph ~/patchbay.qpwgraph -am
run_or_restart discover-overlay discover-overlay
