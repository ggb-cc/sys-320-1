#!bin/bash

file="/var/log/apache2/access.log"


allLogs=$(cat "$file" | grep "curl" | cut -d" " -f1,12)

countedLogs=$(echo "$allLogs" | sort | uniq -c)

echo "$countedLogs"
