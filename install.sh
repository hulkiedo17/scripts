#!/usr/bin/env bash

packages=(vim gcc g++ clang gdb make cmake valgrind nasm
	asciinema xterm cppcheck strace tmux time binutils
	util-linux shellcheck xclip)

if [ -f "/etc/debian_version" ] ; then
	linux_type=debian
elif [ -f "/etc/arch-release" ] ; then
	linux_type=arch
else
	echo "unknown linux release"
	exit 0
fi

for i in ${packages[*]}; do
	printf "\n[%s]\n" "$i"

	if [ "$linux_type" == "debian" ] ; then
		yes | sudo apt-get install "$i"
	elif [ "$linux_type" == "arch" ] ; then
		yes | sudo pacman -S "$i"
	else
		echo "unknown type of linux release"
	fi
done

