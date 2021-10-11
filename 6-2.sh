#!/bin/bash

count=$1
factorial=1
if [[ $count =~ ^[0-9]+$ ]]
	then
	while [ $count -gt 0 ]
	do
		factorial=$(( $factorial * $count ))
		count=$(( $count - 1 ))
	done
fi
echo $factorial
