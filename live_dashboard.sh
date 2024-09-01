#!/bin/bash

# Function to display CPU usage
cpu_usage() {
    echo "CPU Usage:"
    top -bn1 | grep "Cpu(s)" | \
    sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | \
    awk '{print 100 - $1"%"}'
   
}

# Function to display Memory usage
memory_usage() {
    echo "Memory Usage:"
    free -h | grep Mem | awk '{print $3 "/" $2 " (" $3/$2*100"%)"}'
}

# Function to display Disk usage
disk_usage() {
    echo "Disk Usage:"
    df -h | grep '^/dev/' | awk '{print $1 " - " $3 "/" $2 " (" $5 ")"}'
}

# Function to display System Load
system_load() {
    echo "System Load (1, 5, 15 min):"
    uptime | awk -F'load average: ' '{print $2}'
}

# Function to display the live dashboard
display_dashboard() {
    clear
    echo "----------------------------------------"
    echo "          SYSTEM MONITOR DASHBOARD      "
    echo "----------------------------------------"
    cpu_usage
    memory_usage
    disk_usage
    system_load
    echo "----------------------------------------"
}

# Function to handle command-line switches
while getopts "cmdsl" option; do
    case $option in
        c) cpu_usage ;;
        m) memory_usage ;;
        d) disk_usage ;;
        s) system_load ;;
        l) while true; do display_dashboard; sleep 5; done ;;
        *) echo "Invalid option"; exit 1 ;;
    esac
done

# If no switches, display the live dashboard
if [ $# -eq 0 ]; then
    while true; do
        display_dashboard
        sleep 5
    done
fi

