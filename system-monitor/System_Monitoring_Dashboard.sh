#!/bin/bash

echo "===== SYSTEM MONITORING DASHBOARD ====="

#Chcking CPU Usage

cpu_usage=$(top -bn1 | awk '/Cpu/ {print 100-$8}')
cpu_usage=${cpu_usage:-0}
echo "CPU Usage: $cpu_usage%"

#Checking Memory Usage
memory_usage=$(free | awk '/Mem/ {printf("%.2f",$3/$2*100)}')
memory_usage=${memory_usage:-0}
echo "Memory Usage:$memory_usage%"

#Checking Disk Usage
disk_usage=$(df / | awk 'END {print $5}' | sed 's/%//')
echo "Disk Usage: $disk_usage%"

#Here we are checking sys uptime
uptime_info=$(uptime)
echo "Uptime: $uptime_info"


echo "___________________________"


#Alerts
if (( $(echo "$cpu_usage > 80" | bc -l) )); then
	echo " High CPU Usage!"
fi

if (( $(echo "$memory_usage > 80" | bc -l) )); then
	echo " High Memory Usage!"
fi

if [ "$disk_usage" -gt 80 ]; then
	echo "Disk almost full!"
fi

