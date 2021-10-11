#!/bin/bash

version=1.0
Output() {
	echo "Usage: ./rpsm.sh <options> < directory>"
echo "Reports selected information about specified directory tree.\n"
	echo "Options:"
	echo "-h Print this help message, i.e., \"Usage: ./rpsm.sh ... ... (except -h and -v)"
	echo "-v Print script version information, i.e., 1.0"
	echo "-u Find and list all files (just file names) with setuid set, all owners"
	echo "-g Find and list all files (just file names) with setgid set, all owners"
	echo "-w Find and list all files (just file names) that are world-writable"
	echo "-b Find and list all files (just file names) whose size is at least 10M"
	echo "-d Report directory disk usage"
	echo "-i Report information about the file system"
	echo "-a All of the above (except -h and -v)"
	echo ""
}

args=${@:$#}

while getopts ":ugwbbdiahv" o;
do
	case "${o}" in
		u)
			find $args -type f -perm /4000
			echo ""
			;;
		g)
			find $args -type f -perm /2000
 			echo ""
			;;
		w)
			find $args -type f -perm -o+w
			echo ""
			;;
		b)
			find $args -type f -size +10M
 			echo ""
			;;
		d)
			du $args
			echo ""
			;;
		i)
			df $args
			echo ""
 			;;
		a)
			find $args -type f -perm +4000
   			find $args -type f -perm +2000
			find $args -type f -perm -o+w
			find $args -ty pe f -size +10M
			du $args
			df $args
			echo ""
			;;
		h)
			Output
			;;
		v)
			echo "$version"
			;;
		*)
			echo "Usage: ./rpsm.sh <options> < directory>"
			;;


	esac
done
shift "$((OPTIND-1))"


