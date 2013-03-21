#!/bin/sh
red='\e[0;31m'
NC='\e[0m' # No Color
echo -e "${red}Shared memory, Semaphores, and Message queues:${NC} "
ipcs -ma
echo -e "${red}Non ''sleeping'' process:${NC} "
ps -eo %cpu,pid,vsz,args,wchan | egrep -v '^ 0.0|^ 0.1'
echo -ne "\n${red}Nbr of openned files / max files open:${NC} "
cat /proc/sys/fs/file-nr | awk '{ print $1 "/" $3 } '
echo -e "\n${red}Memory usage in Megabytes:${NC} "
free -m
echo -en "\n${red}Server uptime:${NC} "
uptime

# EOF
