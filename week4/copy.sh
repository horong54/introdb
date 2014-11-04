#!/bin/bash
DIR=/opt/tomcat/webapps/ROOT/
if [ $# -ne 1 ]; then
	echo "usage: $0 filename"
	exit 1
fi

cp $1 $DIR
