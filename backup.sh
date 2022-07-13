#!/usr/bin/env bash

if [ $# -lt 3 ] ; then
	printf "you did not provide any options.\n"
	printf "usage: ./backuper [create|decompress] [name] [path]\n\n"

	exit 1
fi

backup_name="$2"

if [[ "$backup_name" != *".tar.gz"* ]] ; then
	backup_name+=".tar.gz"
fi

archive_name=$(basename $backup_name .gz)
path="$3"

if [[ "$1" == "create" ]] ; then
	echo "generating backup..."
	tar -cpvzf "$backup_name" "$path"
elif [[ "$1" == "decompress" ]] ; then
	echo "unpacking backup..."
	gzip -d "$backup_name"
	tar -xvf "$archive_name" -C "$path"
	rm "$archive_name"
fi

exit 0
