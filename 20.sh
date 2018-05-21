#!/bin/sh
[ -z "$1" ] && echo "No arguments: need directory" && exit
[ ! -e "$1" ] && echo "$1 not found" && exit
[ ! -d "$1" ] && echo "$1 not a directory" && exit

DIR=$1

MAXLINKS=`find $DIR -maxdepth 1 -type f -ls | awk '{print $4}' | sort -n | tail -1`
FILES=`find . -maxdepth 1 -type f -ls | awk '{print $4, $11}' | sort -n | grep "^$MAXLINKS " | awk '{print $2}'`

echo $FILES
rm -rf $FILES

find $DIR -maxdepth 1 -type d -depth -empty -print -delete
