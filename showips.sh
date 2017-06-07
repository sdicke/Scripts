#!/bin/bash

for current in `. interfaces.sh`; 
do
	echo $current `./getip.sh -4 $current` `./getip.sh -6 $current`;
done;
