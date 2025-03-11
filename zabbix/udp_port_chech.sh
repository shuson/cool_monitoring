#!/bin/bash

# Define the port range
START_PORT=10000
END_PORT=100500

# Function to check if a UDP port is open
check_udp_port() {
    local port=$1
    timeout 1 bash -c "echo > /dev/udp/127.0.0.1/$port" >/dev/null 2>&1
    if [ $? -eq 0 ]; then
        echo 1
    else
        echo 0
    fi
}

# Check all ports in the range
for port in $(seq $START_PORT $END_PORT); do
    status=$(check_udp_port $port)
    echo "Port $port: $status"
done

