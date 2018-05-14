#!/bin/bash

timezone="GMT+2"

for i in *.txt; do
    # Copy to temporary file in order to avoid weird name formatting issues (spaces, special characters)
    cp -n "$i" "temp.txt"

    # Get last modified timestamp in format "02/08/2015 21:14:44"
    timestamp=$(GetFileInfo -d temp.txt)
    echo $i"\t\t"$timestamp

    # Convert time to DayOne format (note that timezone is specified as Paris time)
    dayone_date_format=$(date -j -f "%m/%d/%Y %H:%M:%S" +"	Date:	%B %d, %Y at %H:%M:%S $timezone" "$timestamp")
    
    echo "\n\n$dayone_date_format\n\n$(cat temp.txt)" >> diary_log.txt
    rm temp.txt
done

echo "All entries have been put into diary_log.txt, now import this file from DayOne"


