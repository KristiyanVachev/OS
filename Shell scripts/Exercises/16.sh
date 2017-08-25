#!/bin/bash

for file in $@; do
	if [[ -f $file ]]; then
		if [[ -r $file ]]; then
			echo "Has permission"
		else 
			echo "No permission"
		fi
	elif [[ -d $file ]]; then
		fileCount=$(find -type f | wc -l)
		echo $fileCount
		echo "dir"
	else
		echo "neither"
	fi
done
