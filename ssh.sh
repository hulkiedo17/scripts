#!/usr/bin/env bash

if [ -z "$1" ] ; then
	echo "please type your email."
	exit 0
fi

ssh-keygen "-t" "ed25519" "-C" "\"$1\""
cat ~/.ssh/id_ed25519.pub | xclip "-selection" "clipboard"

