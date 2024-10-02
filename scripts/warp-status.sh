#!/bin/sh

OUTPUT="$(warp-cli status | awk -F ': ' '/Status update/ {print $2}' | awk '{print $1}')"


if [ "${OUTPUT}" = "Disconnected." ]; then
    OUTPUT="${OUTPUT%.}"
fi

echo "Warp: ${OUTPUT}"
