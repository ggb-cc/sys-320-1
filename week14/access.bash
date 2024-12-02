#! /bin/bash

accessedstring="The file was accessed "

accessedstring+=$(date)

echo "${accessedstring}" >> /home/champuser/sys-320-1/week14/fileaccesslog.txt

echo "To: griffin.goochbreault@mymail.champlain.edu" > /home/champuser/sys-320-1/week14/emailform2.txt
echo "Subject: File Access Update" >> /home/champuser/sys-320-1/week14/emailform2.txt
cat /home/champuser/sys-320-1/week14/fileaccesslog.txt | sed "s/:/-/g" >> /home/champuser/sys-320-1/week14/emailform2.txt
cat /home/champuser/sys-320-1/week14/emailform2.txt | ssmtp griffin.goochbreault@mymail.champlain.edu
