يي# Enterprise_Project
#!/bin/bash

#cpu load

CPU_U=(mpstat 1 1 | awk '/average/ {print 100-$NF} ')       #mpstat 1  1  wait one sec check the server stats once
echo "CPU USAGE : $CPU_U %"

#memory usage

memo=(du -h)
echo "memory usage: $memo % "

#Disk space

disk=(df -h | grep -E '^/dev' )
echo "Disk space : $disk "


#services

if systemctl is-active "$service"
 then
    echo "$service is running"
else
    echo "$service is not running"
fi

#display top processes consuming resources 

ps aux --sort=cpu | head -6 | tail -5
ps aux --sort=-%mem | head -6 | tail -5

