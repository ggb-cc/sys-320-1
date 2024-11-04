#!bin/bash

file="/var/log/apache2/access.log"

function pageCount(){
	pages=$(cat "$file" | cut -d' ' -f7)
	pagesSorted=$(echo "$pages" | sort | uniq -c)
}

pageCount
echo "$pagesSorted"
