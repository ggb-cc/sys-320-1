#! /bin/bash


if [ ! ${#} -eq 2 ]; then
	echo -e "Bad input, please enter the path to the log file followed by the path to the ioc file\n"
else
	log=$1
	IOC=$2
	:> report.txt

	susLogs=$(cat "$log" | grep -f "$IOC" | cut -d' ' -f1,4,7 | tr -d '[')
	echo "${susLogs}"
	echo "$susLogs" >> report.txt
fi
