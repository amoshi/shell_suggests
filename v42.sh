#!/bin/sh

[ -z "$1" ] && echo "No arguments" && exit 1
READFILE="$1"
[ ! -f "$DIRNAME" ] && echo "$READFILE is not a file" && exit 3

[ -z "$2" ] && echo "No write file" && exit 2
WRITEFILE="$2"

[ -z "$3" ] && echo "No count parameter" && exit 3
COUNT="$3"

tac $READFILE | sed -e 's/[^ \t]*/& THAT IS ALL /g' > $WRITEFILE
