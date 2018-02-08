#!/bin/bash

DIRECTORY="/root/scripts/test"

if [ -d $DIRECTORY ]; then
	for COUNT in 123
	do
		echo "Directory Exists Linke # $COUNT"
	done
else
	while read HOST; do
		ping -c 1 $HOST
	done < myhosts
fi
