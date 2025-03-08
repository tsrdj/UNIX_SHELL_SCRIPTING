#!/bin/sh

File=$1
var1=$(tail -1 "$File" | cut -d '|' -f3)
var2=$(sed '1d;$d' "$File" | uniq | wc -l)
if [ "$var1" -eq "$var2" ];
then
echo "Validation Successful"
else
echo "Validation Failed"
fi

var3=$(awk -F'|' '{print NF}' "$File" | sort -u | wc -l)
if [ "$var3" -eq 1 ];
then
  echo "Validation Successful : Records have the same number of fields."
else
  echo "Validation Failed : Number of fields are not same"
  exit 1
fi


var4=$(sort "$File" | uniq -id)
if [ -z "$var4" ];
then
    echo "Validation Successful : File doesn't have duplicate records"
else
    echo "Validation Failed: Duplicate Record Found"
fi

