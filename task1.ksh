#!/bin/sh
File=$1
var1=$(tail -1 "$File" | cut -d '|' -f3)
var2=$(sed '1d;$d' "$File" | wc -l)
if [ "$var1" -eq "$var2" ];
then
echo "Validation Successful"
else
echo "Validation Failed"
fi
