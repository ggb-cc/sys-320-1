#! /bin/bash

report="report.txt"

outputFile="/var/www/html/report.html"

heading=\
"<html>\n"\
"<head>\n"\
"<title>Access logs woth IOC indicators</title>\n"\
"<style> table, th, td {border: 1px solid black; }</style>\n"\
"</head>\n"\
"<body>\n"\
"<br>\n"\
"<br>\n"\
"Access logs with IOC indicators:\n"\
"</br>\n"\
"</br>\n"\
"<table>\n"\
"<tbody>\n"

closer=\
"</tbody>\n"\
"</table>\n"\
"</body>\n"\
"</html>\n"





echo -e ${heading} > "$outputFile"

while read -r line; do

echo "<tr><td>" >> "$outputFile"
echo "$line" | sed 's/ / <\/td><td> /g' >> "$outputFile"
echo "</td></tr>" >> "$outputFile"
done < "$report"

echo -e "$closer" >> "$outputFile"





