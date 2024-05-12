#!/bin/bash

check_server() {
    local server=$1
    local port=${2:-22}
    if nc -z -w 1 $server $port 2>/dev/null; then
        echo -n "✓"
    else
        echo -n "✗"
    fi
}

while IFS= read -r server; do
    check_server "$server"
done < ~/server
