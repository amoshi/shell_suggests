#!/bin/sh

[ -z "$1" ] && echo "No arguments" && exit 1
DIRNAME="$1"
[ ! -d "$DIRNAME" ] && echo "$DIRNAME is not a directory" && exit 3
SEARCHMASK="$2"

[ -z "$2" ] && echo "No search mask" && exit 2

mkdir tmp
LISTFILES=`ls -al $DIRNAME | grep '^-' | grep $SEARCHMASK | awk '{print $9}'`

for FILE in $LISTFILES
do
	tmpfile=`mktemp tmp/$FILE.XXXXXX`
	#sort -u $FILE > $tmpfile
	cat $FILE | awk '{if (!h[$0]) h[$0]=NR} END {for (k in h) {print h[k],k}}' | sort -k1n | cut -d' ' -f2- > $tmpfile
	mv $tmpfile $FILE
done

echo $LISTFILES
