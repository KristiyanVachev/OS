#!/bin/bash

#TODO - validate

if [[ ! -d $1 ]]; then
	
	echo "Parameter must be a directory"
	exit 1
fi

directory=$1

#check if folder exists

logFiles=$(find $directory -maxdepth 1 -iname '*.log')

for logFile in $logFiles; do

	folderBasename=$(basename -s .log $logFile)
	fileDir=$(dirname $logFile)

	folder=$(echo $fileDir/$folderBasename)

	#If folder doesn't exist
	if [[ ! -d $folder ]]; then
		continue
	fi
	
	#Read log file
	fileNum=1
	#steps - time, description, newLine
	step='time'
	newName=''

	IFS=''
	while read line
	do
		if [[ $step = 'time' ]]; then
			#parse time and location
			unixTime=$(echo $line | cut -d' ' -f1 | tr -s ' ')
			
			#location
			location=$(echo $line | cut -d' ' -f2 | tr -s ' ')
			latitude=$(echo $location | cut -d',' -f1)
			longitude=$(echo $location | cut -d',' -f2)

			echo $latitude $longitude	
			year=$(date -d @$unixTime | tr -s ' '| cut -d ' ' -f6)
			month=$(date -d @$unixTime | tr -s ' '| cut -d ' ' -f2)
			day=$(date -d @$unixTime | tr -s ' '| cut -d ' ' -f3)

			hour=$(date -d @$unixTime | tr -s ' '| cut -d ' ' -f4 | cut -d ':' -f1)
			minute=$(date -d @$unixTime | tr -s ' ' | cut -d ' ' -f4 | cut -d ':' -f2)

			newName=$year'-'$month'-'$day'T'$hour$minute

			step='descrption'
		elif [[ $step = 'descrption' ]]; then
			#append description to filename
			descName=$(echo $line | sed -e 's/\s/_/g')
			newName=($newName'_'$descName'.jpg')
			
			#rename file
			file=$(ls $folder -t | head -$fileNum | tail -n +$fileNum)

			mv $folder'/'$file $folder'/'$newName
			
			#add location
			exiftool -exif:gpslatitude=$latitude -exif:gpslongitude=$longitude $folder'/'$newName
			
			step="newLine"
		else
			if [[ -z $line ]]; then
				step="time"
				fileNum=$(($fileNum+1)) 
			fi
		fi

	echo $line
	done < $logFile

done

