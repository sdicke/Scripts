#!/bin/sh

ip "$1" address show dev "$2" | awk '$1 == "inet" || $1 == "inet6"  {print substr($2, 0, index($2, "/") - 1)}';
