#!/bin/bash
start=$(cat -n main.cpp | grep insert_start | awk '{print $1}')
stop=$(cat -n main.cpp | grep insert_stop | awk '{print $1}')
len=$(cat main.cpp | wc -l)
echo $start
echo $stop

tempFile="/tmp/getdata.dat"
getData="getdata.c"
main="main.cpp"
head -n $start $main > $tempFile
cat $getData >> $tempFile
sed -n $stop,"$len"p $main >> $tempFile
#cat $tempFile >> main.cpp
cp $tempFile main.cpp

