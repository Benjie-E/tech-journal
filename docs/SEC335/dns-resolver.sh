#!/bin/bash
network=$1
dns=$2
echo "reverse dns for $network.0/24"
for num in $(seq 0 255); do
	nslookup $network'.'$num $dns|grep "name"&
done
