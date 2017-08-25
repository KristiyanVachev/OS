#!/bin/bash

rand=$(( (RANDOM % 1000) + i))
while read readed
do
	if [ $readed -eq $rand ]; then
		echo "Right!"
		break
	elif [ $readed -gt $rand ]; then
		echo "Down"
	else
		echo "Up"
	fi
done
