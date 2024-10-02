#!/bin/sh

OUTPUT="$(warp-cli status | awk -F ': ' '/Status update/ {print $2}' | awk '{print $1}')"


if [ "${OUTPUT}" = "Disconnected." ]; then
    OUTPUT="${OUTPUT%.}"
    OUTPUT="<span color='red'>${OUTPUT}</span>"
fi

if [ "${OUTPUT}" = "Connecting" ]; then
    OUTPUT="${OUTPUT%.}"
    OUTPUT="<span color='orange'>${OUTPUT}</span>"
fi

if [ "${OUTPUT}" = "Connected" ]; then
    OUTPUT="<span color='green'>${OUTPUT}</span>"
fi

echo "Warp: ${OUTPUT}"
