#!/bin/bash

# Function to display CPU usage
get_cpu_usage() {
    echo "CPU Usage:"
    top -bn1 | grep "Cpu(s)" | \
    awk '{print "  Used: " $2 + $4 "%, Idle: " $8 "%"}'
}

# Function to display memory usage
get_memory_usage() {
    echo "Memory Usage:"
    free -h | awk '
    /^Mem:/ {
        printf "  Used: %s, Free: %s, Usage: %.2f%%\n", $3, $4, ($3/$2)*100
    }'
}

# Function to display disk usage
get_disk_usage() {
    echo "Disk Usage:"
    df -h --total | awk '
    /^total/ {
        printf "  Used: %s, Free: %s, Usage: %s\n", $3, $4, $5
    }'
}

# Function to display top 5 processes by CPU usage
get_top_cpu_processes() {
    echo "Top 5 Processes by CPU Usage:"
    ps -eo pid,comm,%cpu --sort=-%cpu | head -n 6 | awk '
    NR==1 { print "  PID   COMMAND   %CPU" }
    NR>1  { printf "  %-5s %-10s %s\n", $1, $2, $3 }'
}

# Function to display top 5 processes by memory usage
get_top_memory_processes() {
    echo "Top 5 Processes by Memory Usage:"
    ps -eo pid,comm,%mem --sort=-%mem | head -n 6 | awk '
    NR==1 { print "  PID   COMMAND   %MEM" }
    NR>1  { printf "  %-5s %-10s %s\n", $1, $2, $3 }'
}

# Optional: Function to display additional stats
get_additional_stats() {
    echo "Additional Stats:"
    echo "  OS Version: $(lsb_release -d | awk -F'\t' '{print $2}')"
    echo "  Uptime: $(uptime -p)"
    echo "  Load Average: $(uptime | awk -F'load average:' '{print $2}')"
    echo "  Logged In Users: $(who | wc -l)"
    echo "  Failed Login Attempts: $(journalctl _COMM=sshd | grep 'Failed password' | wc -l)"
}

# Main script execution
echo "Server Performance Stats"
echo "========================="
get_cpu_usage
echo
get_memory_usage
echo
get_disk_usage
echo
get_top_cpu_processes
echo
get_top_memory_processes
echo
get_additional_stats
echo
