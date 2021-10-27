#!/bin/sh

path="$1";

#Asked user for path, when no was given
if [ -z "$path" ]; then
	echo "Path:";
	read -r path;
fi;

#Selected executing user as path owner, when no was given
user=${2:-"$LOGNAME"}

#Use tmpfs und allow user to access the path fully
echo "Insert the root password";
su  -c "mount -t tmpfs none $path && chown -R $user $path && chgrp -R $user $path";
