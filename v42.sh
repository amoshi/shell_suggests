#!/bin/sh

[ -z "$1" ] && echo "No arguments" && exit 1
READFILE="$1"
[ ! -f "$READFILE" ] && echo "$READFILE is not a file" && exit 3

[ -z "$2" ] && echo "No write file" && exit 2
WRITEFILE="$2"

[ -z "$3" ] && echo "No count parameter" && exit 3
COUNT="$3"

#for IND in `seq $COUNT`
for ((i=0; i < $COUNT; i++))
do
	MESG="$MESG THAT IS ALL "
done

tac $READFILE | sed -e "s/[^ ]*/& $MESG /g" > $WRITEFILE
