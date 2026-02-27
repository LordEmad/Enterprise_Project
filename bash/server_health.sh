#!/bin/bash

#--------------------------------------------------------------------- CPU Usage


CPU_U=$(mpstat 1 1 | awk '/[Aa]verage/ {print 100-$NF}')
echo "CPU Usage: $CPU_U%" >> /var/log/health_report.log

#-------------------------------------------------------------------- RAM Usage


UsedMem=$(free -m | awk '/Mem/ {print $3}')
TotalMem=$(free -m | awk '/Mem/ {print $2}')
RamPercent=$(( UsedMem * 100 / TotalMem ))
echo "Memory Used: ${UsedMem}MB / ${TotalMem}MB (${RamPercent}%)" >> /var/log/health_report.log

if [[ $RamPercent -gt 80 ]]; then
    echo "WARNING: RAM usage is above 80%!" >> /var/log/health_report.log
fi

#------------------------------------------------------------------- Disk Usage


DiskU=$(df -h | awk ' $6 == "/" {print $5}')
echo "Disk Usage: $DiskU" >> /var/log/health_report.log

#---------------------------------------------------------------------services


services=("sshd"  "nginx" "crond")
for service in "${services[@]}"
do
	status=$(systemctl is-active $service )
       if [[ $status == "active" ]]	
       then
	       echo "$service : Running " >> /var/log/health_report.log
       else
	       echo "$service : stopped " >> /var/log/health_report.log
       fi
done 
#-------------------------------------------------------------------- uptime

Uptime=$(uptime -p )
echo "uptime : $Uptime" >> /var/log/health_report.log


