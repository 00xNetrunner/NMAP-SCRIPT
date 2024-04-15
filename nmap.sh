#!/bin/bash

# A shell script to automate nmap scans for TCP and UDP.
# Created by Netrunner

# Function to perform nmap scan and save output
perform_scan() {
    # Assigning command-line arguments to local variables
    local ip=$1
    local scan_type=$2
    local ports=$3
    local extra_args=$4
    # Generate a timestamp for file naming
    local timestamp=$(date +"%Y-%m-%d_%H-%M-%S")
    # File names for the nmap output
    local file_name="${ip}_${scan_type}_${timestamp}"
    local log_file="scan_log_${timestamp}.txt"

    # Logging and performing the nmap scan, outputting to text and XML
    echo "[$(date)] Starting ${scan_type} scan on ${ip}..." | tee -a "${log_file}"
    nmap $scan_type -p "$ports" $extra_args -oN "${file_name}.txt" -oX "${file_name}.xml" $ip
    # Checking the exit status of nmap command
    if [ $? -eq 0 ]; then
        echo "[$(date)] ${scan_type} scan on ${ip} completed successfully." | tee -a "${log_file}"
    else
        echo "[$(date)] Error occurred during ${scan_type} scan on ${ip}." | tee -a "${log_file}"
    fi
}

# Check for at least one command-line argument
if [ $# -lt 1 ]; then
    echo "Usage: $0 <IP-address-1> [IP-address-2] ..."
    exit 1
fi

# Define port ranges for TCP and UDP
tcp_ports="1-65535"
udp_ports="1-500"

# Loop through the IP addresses provided as arguments
for ip in "$@"; do
    # Performing TCP and UDP scans using the perform_scan function
    perform_scan "$ip" "-sT" "$tcp_ports" "-vv -T5 -sV -O --osscan-guess --script=banner,vuln,exploit -A"
    perform_scan "$ip" "-sU" "$udp_ports" "-vv --scan-delay 1s -sV --script=banner,vuln -A"
done
