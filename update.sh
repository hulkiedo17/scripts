#!/usr/bin/env bash

if [ -f "/etc/debian_version" ] ; then
	yes | sudo apt-get update
	yes | sudo apt-get upgrade
	yes | sudo apt-get dist-upgrade
elif [ -f "/etc/arch-release" ] ; then
	yes | sudo pacman -Syu
	yes | sudo pacman -Syy
else
	echo "unknown linux release"
	exit 0
fi

