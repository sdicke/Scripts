#!/bin/sh

path=$1;
user=$2;

#Asked user for path, when no was given
if [ -z $path ]; then
	echo "Path:";
	read path;
fi;

#Selected executing user as path owner, when no was given
if [ -z $user ]; then
	user=`whoami`;
fi;

#Use tmpfs und allow user to access the path fully
su  -c "mount -t tmpfs none $path && chmod 755 $path && chown -R $user $path && chgrp -R $user $path";
