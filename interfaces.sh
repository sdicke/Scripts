#!/bin/bash

#Lists all network interfaces available on the system

for current in `ip address show | awk 'index($1, ":") != 0 {print substr($2, 0, index($2, ":"))}'`;
do
	if [[ $current && !($1 && $current = "lo") ]]; then
		echo $current;
	fi;
done;
