#!/bin/bash

LOG_FILE="$(dirname "$0")/../logs/baglanuly_abat_system.log"

TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")
STUDENT_NAME="Baglanuly Abat"
SYS_USER=$(whoami)
OS_VERSION=$(grep -E '^PRETTY_NAME=' /etc/os-release | cut -d'=' -f2 | tr -d '"')
KERNEL_VER=$(uname -r)
CPU_LOAD=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4"%"}')
MEM_USAGE=$(free -h | awk '/Mem:/ {print "Used: " $3 " / Total: " $2}')
DISK_USAGE=$(df -h / | awk 'NR==2 {print "Used: " $3 " / Free: " $4 " (Used %: " $5 ")"}')

REPORT="----------------------------------------
[SYSTEM REPORT - $TIMESTAMP]
Student: $STUDENT_NAME
Logged-in User: $SYS_USER
OS Version: $OS_VERSION
Kernel Version: $KERNEL_VER
CPU Usage: $CPU_LOAD
Memory Usage: $MEM_USAGE
Disk Space (/): $DISK_USAGE
----------------------------------------"

echo "$REPORT"
echo "$REPORT" >> "$LOG_FILE"


