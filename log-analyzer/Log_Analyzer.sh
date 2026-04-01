#!/bin/bash

#input from user
read -p "Enter log file path: " logfile

#checking file exist or not
if [ ! "$logfile" ]; then
	echo "Log file not found!"
	exit 1
fi


#log report 
echo "===== LOG ANALYSIS REPORT ====="

total_lines=$(wc -l < "$logfile")
echo "Total lines: $total_lines"

error_count=$(grep -i "error" "$logfile" | wc -l)
echo "Error count: $error_count"

failed_logins=$(grep -iE "failed|failure" "$logfile" | wc -l)
echo "Failed login attempts: $failed_logins"

echo "Unique IP addresses:"
grep -oE '([0-9]{1,3}.){3}[0-9]{1,3}' "$logfile" | sort | uniq

echo "========================================================="
