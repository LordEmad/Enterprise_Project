#!/bin/bash

#------------------------------------------------------------------------------------------------------print usernames

awk -F: '{print $1 } ' /etc/passwd

#-----------------------------------------------------------------------------------------------------check last activity

Days=30
while IFS=: read -r username _ uid _                                              #  make the separator colon: then read line by line || then go the /etc/passwd focus in username uid  
do
if [[ "$uid" -ge 1000  ]]                                                         #  any uid -ge 1000 is a real user 
then
last=$(lastlog -u "$username" | awk 'NR==2 {print $6,$7,$10}')                    #  doing the lastlog command and customize it 
if echo "$last" | grep -qi "never"                                                #  if the user never logged in it will be removed directly
then
	userdel "$username"
else
	echo "user is fine"
fi

last_sec=$(date -d "$last" +"%s")                                                 # make it sec so i can compare it by numbers
now_sec=$(date +"%s")                                                             # the same


last_day=$(( (now_sec - last_sec ) /86400))                                       # convert into days

if [[  "$last_day" -gt  $Days  ]] 
	then
        userdel "$username"
else
        echo "user is active"
fi

fi
done < /etc/passwd

#--------------------------------------------------------------------------------------------------------Flags accounts with no password or weak password policies Sudo check
while IFS=: read -r username _
do
    pass=$(passwd -S $username 2>/dev/null | awk '{print $2}')

    if [[ $pass == "NP" ]] 
    then
        echo "WARNING: $username has no password!"
    else
        echo "$username : OK"
    fi

    if groups $username 2>/dev/null | grep -q "wheel" 
    then
	    echo "warning : $username has a sudo privileges"
    fi
    


done < /etc/passwd

#------------------------------------------------------------Checks for locked/expired accounts & Outputs a clean report to a file



expiry=$( chage -l $username 2>/dev/null | awk -F:  '/Account expires/ {print $2}'  )

if [[   $expiry != "never"    ]]
then
           echo "Warning this acc $username expires in $expiry" 
fi











