#!/bin/bash

for current in  $(interfaces.sh); 
do
	interface=$current;
	if [[ "$1" = "--help" ]]; then
        	echo "showips shows available interfaces and their attached IP addresses:";
        	echo "Usage: showips [nonames] [IP version] [lo]";
        	echo "nomames: do not show interfaces names";
        	echo "without version: both IPv4 and IPv6 addresses";
        	echo "lo: do not show loop device's address";
		exit 0;
	fi;
	if [[ "$1" = "nonames" ]]; then
		interface="";
		shift;
	fi;
	version="$1";
	if [[ "$version" = "4" || $version = "6" ]]; then
		vmode="true";
		shift;
		next="$1";
	fi;
	if [[ $current = "lo" && "$next" = "lo" ]]; then
		continue;
	fi;
	if [[ $vmode ]]; then
		echo "$interface" "$(getip.sh "$version" "$current")";
	else
		echo "$interface" "$(getip.sh 4 "$current") $(getip.sh 6 "$current")";
	fi;
done;
