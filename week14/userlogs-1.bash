#! /bin/bash

authfile="/var/log/auth.log"
authfile2="/var/log/auth.log.1"

function getLogins(){
 logline=$(cat "$authfile2" | grep "systemd-logind" | grep "New session")
 logline+=" "
 logline+=$(cat "$authfile" | grep "systemd-logind" | grep "New session")
 dateAndUser=$(echo "$logline" | cut -d' ' -f1,2,11 | tr -d '\.')
 echo "$dateAndUser"
}

function getFailedLogins(){


 logline=$(cat "$authfile2" | grep "authentication failure")
 logline+=" "
 logline+=$(cat "$authfile" | grep "authentication failure")
 dateAndUser=$(echo "$logline" | cut -d' ' -f1,2,16 | sed 's/user=//')
 echo "$dateAndUser"




# Todo - 1
# a) Make a little research and experimentation to complete the function
# b) Generate failed logins and test
}

# Sending logins as email - Do not forget to change email address
# to your own email address
echo "To: griffin.goochbreault.champlain.edu" > emailform.txt
echo "Subject: Logins" >> emailform.txt
getLogins >> emailform.txt
cat emailform.txt | ssmtp griffin.goochbreault@mymail.champlain.edu


echo "To: griffin.goochbreault.champlain.edu" > emailform.txt
echo "Subject: Failed Logins" >> emailform.txt
getFailedLogins >> emailform.txt
cat emailform.txt | ssmtp griffin.goochbreault@mymail.champlain.edu



# Todo - 2
# Send failed logins as email to yourself.
# Similar to sending logins as email 

