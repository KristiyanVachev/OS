#!/bin/bash

word="word"

if [[ $word =~ [A-Za-z0-9] ]]; then
	echo "yes"
else
	echo "no"
fi
