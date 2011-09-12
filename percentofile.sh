#!/bin/sh
# Public Domain, by Neil Grogan 2010
# Script to output last 30% of file by lines 

OLDFILE="oldlog.txt"
NEWFILE="newlog.txt"
PERCENT=0.7

#Use wc to count lines
LINES=$(wc -l $OLDFILE | awk '{ print $1}')

#Linespercent = 2 decimal places, lines by percent, round to whole
LINESPERCENT=$(echo "scale=2; $LINES*$PERCENT" | bc | xargs printf "%1.0f" )  

# Use tail to get last  30% and output, can use tail -s with sleep time to have it run on sched.
tail -n $LINESPERCENT $OLDFILE >> $NEWFILE
