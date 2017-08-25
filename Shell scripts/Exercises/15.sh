#!/bin/bash

#TODO validate input

files=$(ls $1 -l)

#TODO split by newline
for file in $files; do
	echo "$file"
done
