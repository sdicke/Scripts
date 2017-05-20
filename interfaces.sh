#!/bin/bash

#Lists all network interfaces available on the system

list=`ip address show | awk 'index($1, ":") != 0 {print substr($2, 0, index($2, ":") -1)}'`;

for current in $list;
do
	if [ $current ]; then
		echo $current;
	fi;
done;
