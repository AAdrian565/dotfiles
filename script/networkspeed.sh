#!/bin/bash
# ~/script/net_speed.sh
interface=$(ip route | awk '/default/ {print $5}')
RX1=$(cat /sys/class/net/$interface/statistics/rx_bytes)
TX1=$(cat /sys/class/net/$interface/statistics/tx_bytes)
sleep 1
RX2=$(cat /sys/class/net/$interface/statistics/rx_bytes)
TX2=$(cat /sys/class/net/$interface/statistics/tx_bytes)
RX_RATE=$(( (RX2 - RX1) / 1024 ))
TX_RATE=$(( (TX2 - TX1) / 1024 ))
echo " ⇣${RX_RATE}KB/s ⇡${TX_RATE}KB/s "
