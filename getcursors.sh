#!/bin/sh

#fetches and installs Debian's oxgencursors on non-debian system

package="oxygencursors_0.0.2012-06-kde4.8-2.1_all.deb";
dir="deb";
data="data.tar";

wget "https://ftp.de.debian.org/debian/pool/main/o/oxygencursors/"$package;

mkdir $dir;
mv $package $dir;
cd $dir || exit 1;
ar -x $package;
unxz $data.xz;
tar -xf $data;
su -c "cp -R etc usr /";
cd .. && rm -r $dir;
