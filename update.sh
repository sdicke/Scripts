#!/bin/sh

#Updates systems with apt based package management

su -c "apt-get update && apt-get dist-upgrade";
