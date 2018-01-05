#!/bin/bash
# Simple bash script list all the contents in a directory and write the output
#Usage : ./findlist.sh /foldername namefile.txt

location=$1 #Stdin
filename=$2 #Stdout

if [ -z "$location" ]  
then 
	echo "Please provide location argument"
	exit 0 #A successfully executed code
fi

if [ -z "$filename" ]
then
	echo "Please provide filename argument"
	exit 0 #A successfully executed code
fi

ls $location > $filename #Redirect IO into file if >> append
echo "Script is complete and has indexed the $location"
echo "####################################"
echo "Displaying contents of our $filename"
echo "####################################"
cat $filename
