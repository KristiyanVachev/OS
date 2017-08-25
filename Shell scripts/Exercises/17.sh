#!/bin/bash

#Validate amount of parameters
if [[ $# -ne 2 ]]; then
	echo "Expecting 2 parameters"
	exit 1
fi

#Validate first parameter is a directory
if [[ ! -d $1 ]]; then
	
	echo "First parameter must be a directory"
	exit 2
fi

#Validate second parameter is a number
if [[ ! $2 =~ [0-9] ]]; then
	echo "Second parameter must be a number"
	exit 3
fi


