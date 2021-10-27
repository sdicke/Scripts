#!/bin/bash

#Invoke this script by an SSH key file name. If your key is named id_nas, then Invoke with ./keyorg.sh id_nas

key="$1";
folder="/home/$LOGNAME/.ssh/";
list=$(ssh-add -l | awk '{print $3}');
file="$folder$key";
for current in $list; do
	if [[ $(basename "$current") = "$key" ]]; then
		success="true";
		break;
	fi;
done;

if [[ -z $success && -r "$file" ]]; then
	ssh-add "$file";
fi;
