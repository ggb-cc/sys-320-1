#!bin/bash

file="/var/log/apache2/access.log"

function pageCount(){
	pages=$(cat "$file" | cut -d' ' -f7 | tr -d "/")
	echo "$pages" | sort -n | uniq   #| uniq -c | sort -u
}

pageCount
