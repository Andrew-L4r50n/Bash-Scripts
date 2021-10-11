#!/bin/sh

file1=$1	#Variable declaration
file2=$2 	#Variable declaration

result=$(diff -y file1 file2 > a.txt)
if [ $? -eq 0 ]
	then
		echo "They are the same"
	else
		echo "They are different"
fi
