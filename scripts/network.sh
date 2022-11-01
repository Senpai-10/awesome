#!/bin/env bash

rxcurrent="$(($(cat /sys/class/net/*/statistics/rx_bytes | paste -sd '+')))"
txcurrent="$(($(cat /sys/class/net/*/statistics/tx_bytes | paste -sd '+')))"

download=$(numfmt --to=iec-i --suffix=B $rxcurrent)
upload=$(numfmt --to=iec-i --suffix=B $txcurrent)

echo -e "▼ $download / ▲ $upload"
