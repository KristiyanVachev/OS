#!/bin/bash

read -p "Username: " username

#echo $(who | grep $username | wc -l)

while [ true ]
do
	if [[ $(who | grep $username) ]]; then
		echo "yey"
		break
	fi
	
	echo "poop"
	sleep 1
done
