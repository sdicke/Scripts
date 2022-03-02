#!/bin/bash

interfaces(){
	#Lists all network interfaces available on the system
	for current in $(ip address show | awk 'index($1, ":") != 0 {print substr($2, 0, index($2, ":") - 1)}');
	do
		if [[ "$current" && ! ($1 && "$current" = "lo") ]]; then
			echo "$current";
		fi;
	done;
}

getip(){
	#$1 = IP protocoll version, $2 = interface name
	ip "-${1}" address show dev "$2" | awk '$1~/inet/ {print substr($2, 0, index($2, "/") -1 )}'
}

showips(){
	for current in  $(interfaces);
	do
		local interface="$current";
		if [[ "$1" = "--help" ]];
		then
				echo "showips shows available interfaces and their attached IP addresses:";
				echo "Usage: showips [nonames] [IP version] [lo]";
				echo "nomames: do not show interfaces names";
				echo "without version: both IPv4 and IPv6 addresses";
				echo "lo: do not show loop device's address";
			exit 0;
		fi;
		local v4="$(getip 4 "$current")"
		local v6="$(getip 6 "$current")"
		if [[ -z "$v4" && -z $v6 ]];
		then
			continue;
		fi
		echo $interface: $v4 $v6
	done;
}
showips
