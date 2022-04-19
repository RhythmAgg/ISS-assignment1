#! /bin/bash

file=$1

IFS='~'
while read line
do
	if [[ $line != "" ]]
	then
		read -ra arr<<<"$line"
		echo "${arr[1]} once said \"${arr[0]}\""
	else 
		echo ""
	fi
done < $1 > speech.txt

