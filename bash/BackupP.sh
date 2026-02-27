#!/bin/bash

source="/etc"
Back="/etc/backupP"
time="$(date +%Y_%m_%d-$H_$M ) "

tar -cvzf  $Back_$time.tar.gz   $source

