#!/bin/sh

#Mutes or unmutes output channel 0 (normally the standard output) with PulseAudio

if [ -z "$1" -o  "$1" = "mute" ]; then
	mode=1;
elif [ "$1" = "unmute" ]; then
	mode=0;
fi;

pacmd set-sink-mute 0 $mode > /dev/null 2> /dev/null;
