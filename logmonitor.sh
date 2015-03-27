#!/bin/bash

DIR="/etc/logmonitor"
NAME="logmonitor"
LOGPATH="/var/log/apache2/error-ECS.log"
KEYWORD="Fatal"
#CONFIG_PATH="$DIR/$NAME.conf"
REPORT_PATH="$DIR/report.txt"


while [ 1 -eq 1 ]
do
if tail -f $LOGPATH| grep -q $KEYWORD ; then
	#echo "haha" >> $REPORT_PATH
	LOGCONTENT=`grep $KEYWORD $LOGPATH | tail -n 1`
	echo $LOGCONTENT >> $REPORT_PATH
	echo "---------------------" >> $REPORT_PATH
fi
done
