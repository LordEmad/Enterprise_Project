يي# Enterprise_Project
#!/bin/bash

#-----------------------cpu_load

CPU_U=(mpstat 1 1 | awk '/average/ {print 100-$NF} ')       #mpstat 1  1  wait one sec check the server stats once
echo "CPU USAGE : $CPU_U %"

#--------------------memory_usage
