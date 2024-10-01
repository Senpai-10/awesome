#!/usr/bin/env bash

run() {
    if ! pgrep -f "$1" > /dev/null ;
    then
        "${@:2}"&
    fi
}

run_or_restart() {
    if pgrep -f "$1" > /dev/null
    then
        pkill -f "$1"
        "${@:2}"&
    else
        "${@:2}"&
    fi
}

run picom           picom
run nitrogen        nitrogen --restore
imwheel -kill -b 45
run flameshot       flameshot
run gromit-mpx      gromit-mpx
run xmousepastebloc xmousepasteblock
run Discord         discord --start-minimized --enable-blink-features=MiddleClickAutoscroll
run qpwgraph        qpwgraph ~/patchbay.qpwgraph -am
run nm-applet       nm-applet --indicator
# run steam steam -silent
run_or_restart discover-overlay discover-overlay
run gpick gpick
cmus-rpc -k
