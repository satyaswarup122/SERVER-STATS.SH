#!/bin/bash

# ===== Colors Define =====
GREEN="\033[1;32m"
YELLOW="\033[1;33m"
BLUE="\033[1;34m"
CYAN="\033[1;36m"
RED="\033[1;31m"
RESET="\033[0m"

# ===== Header =====
echo -e "${BLUE}============================================================${RESET}"
echo -e "${GREEN}            SERVER PERFORMANCE MONITORING TOOL${RESET}"
echo -e "${BLUE}============================================================${RESET}"
echo

# ===== Basic Info =====
echo -e "${YELLOW}Date & Time     :${RESET} $(date)"
echo -e "${YELLOW}Hostname        :${RESET} $(hostname)"
echo -e "${YELLOW}OS Version      :${RESET} $(source /etc/os-release && echo $PRETTY_NAME)"
echo -e "${YELLOW}Kernel Version  :${RESET} $(uname -r)"
echo

# ===== CPU Usage =====
CPU_USAGE=$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')
echo -e "${CYAN}Total CPU Usage :${RESET} $CPU_USAGE %"
echo

# ===== Memory Usage =====
MEMORY=$(free -m | awk 'NR==2{printf "%s/%s MB (%.2f%%)", $3,$2,$3*100/$2 }')
echo -e "${CYAN}Total Memory Usage :${RESET} $MEMORY"
echo

# ===== Disk Usage =====
DISK=$(df -h / | awk 'NR==2{print $3 " / " $2 " (" $5 ")"}')
echo -e "${CYAN}Total Disk Usage   :${RESET} $DISK"
echo

# ===== Top 5 Processes by CPU =====
echo -e "${RED}Top 5 Processes (by CPU usage):${RESET}"
ps -eo pid,comm,%cpu,%mem --sort=-%cpu | head -n 6
echo

# ===== Top 5 Processes by Memory =====
echo -e "${RED}Top 5 Processes (by Memory usage):${RESET}"
ps -eo pid,comm,%cpu,%mem --sort=-%mem | head -n 6
echo

# ===== System Uptime & Load Average =====
echo -e "${GREEN}System Uptime    :${RESET} $(uptime -p)"
echo -e "${GREEN}Load Average     :${RESET} $(uptime | awk -F'load average:' '{ print $2 }')"
echo

# ===== Logged-in Users =====
LOGGED_IN=$(who | wc -l)
echo -e "${GREEN}Logged-in Users :${RESET} $LOGGED_IN"
echo

# ===== Failed Login Attempts =====
echo -e "${GREEN}Recent Failed Login Attempts:${RESET}"
lastb -n 5
echo

# ===== Network Info =====
echo -e "${CYAN}Network Interfaces:${RESET}"
ip -brief addr
echo

# ===== Footer =====
echo -e "${BLUE}============================================================${RESET}"
echo -e "${GREEN}   Monitoring Complete! Stay Optimized 🚀${RESET}"
echo -e "${BLUE}============================================================${RESET}"
