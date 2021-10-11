#!/bin/sh

file1=$1	#Variable declaration
file2=$2 	#Variable declaration

if [ "$#" -ne 2 ]
then
    echo "Usage: $0 <filename> <filename>"
    exit 1
fi

if [ -f $file1 ]
then
    echo "File $file1 does not exist"
    exit 1
fi

if [ -f $file2 ]
then
    echo "File $file2 does not exist"
    exit 1
fi

result=$(diff -y file1 file2 > a.txt)
if [ $? -eq 0 ]
	then
		echo "They are the same"
	else
		echo "They are different"
fi
