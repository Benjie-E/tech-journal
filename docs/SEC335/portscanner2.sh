#!/bin/bash
network=$1
port=$2
#echo "network,port"
for num in $(seq 1 254); do
	timeout .1 bash -c "echo >/dev/tcp/$network'.'$num/$port" 2>/dev/null && echo "$network.$num on port:$port"&
done
