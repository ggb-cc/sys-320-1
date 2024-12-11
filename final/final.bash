#! /bin/bash

report="report.txt"

outputFile="/var/www/html/report.html"

heading=\
"<html>\n"\
"<head>\n"\
"<title>Access logs woth IOC indicators</title>\n"\
"</head>\n"\
"<body>\n"\
"<br>\n"\
"<br>\n"\
"Access logs woth IOC indicators:\n"\
"</br>\n" \
"</br>\n"\
"<>\n"



echo -e ${heading} >> "$outputFile"

