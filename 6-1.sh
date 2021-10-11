#!/bin/bash

n=$1	#variable dec
m=$2


result=1

if [[ $n == 1 ]]
then
	echo 0
	exit
fi

if [[ $n =~ ^[0-9]+$ ]]
then
	if [[ "$m" =~ ^[0-9]+$ ]]
	then
		while [ $m -gt 0 ];
		do
			result=$(( $result*$n ))
	    		m=$(( $m - 1 ))
		done
	fi
fi

echo $result
