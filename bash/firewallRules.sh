#!/bin/bash


if [[ $UID -ne 0  ]] ; then
          echo "This script must be run as root"
          exit 1
fi


echo "------------ACTIVATION-----------"


if systemctl is-active --quiet  firewalld ; then

             echo "firewall is running"
else
	     echo "Firewall is not active. Starting it now..."
                  systemctl start firewalld
	
    if systemctl is-active --quiet  firewalld ; then
      
              echo "firewall is running"
    else
              echo "there was an error"
	      exit 1
  fi
fi


echo "------------ENABLE ON BOOT-----------"
systemctl enable firewalld



echo "------------ZONE-----------"

firewall-cmd --set-default-zone=public 


echo "------------SERVICES-----------"

firewall-cmd --permanent --add-service=ssh 
firewall-cmd --permanent --add-service=http
firewall-cmd --permanent --add-service=https
firewall-cmd --permanent --add-service=cockpit


echo "------------PORTS-----------"
firewall-cmd --permanent --add-port=8080/tcp

echo "------------BLOCK------------------"


firewall-cmd --permanent --add-rich-rule=' rule port port=23 protocol=tcp reject ' #telnet
firewall-cmd --permanent --add-rich-rule=' rule port port=21protocol=tcp reject  ' #ftp


echo "------------BRUTEFORCE-----------"
   
firewall-cmd --permanent --add-rich-rule= 'rule service name=ssh limit value=5/m accept  '



echo "------------LOGGING-----------"

firewall-cmd --set-log-denied=all



echo "------------PANIC MODE CHECK-----------"

if firewall-cmd --query-panic | grep -q "yes"; then

    	echo "WARNING: Panic mode was ON! Disabling it..."
   
    	firewall-cmd --panic-off
else

   
       	echo "Panic mode is already off. OK"
fi



echo "------------RELOAD----------------"
firewall-cmd --reload




echo "----------------LIST ALL--------------"
firewall-cmd --list-all
































