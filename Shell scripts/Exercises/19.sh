#!/bin/bash

IFS=:

for file in $PATH; do
	if [[ -e $file ]]; then
		echo "$file is executable"
	fi
done
