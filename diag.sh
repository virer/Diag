#!/bin/sh
red='\e[0;31m'
NC='\e[0m' # No Color
echo -e "${red}Number of file descriptor per process:${NC}"
echo -e        "Nbr of files # \tusername \tprocess/command"
for x in `ps -eo ppid`; do 
  if [ -e "/proc/$x/fd" ]; then
   fd=`ls /proc/$x/fd | wc -l`
   if [ $fd -gt 20 ]; then
      echo -ne "$fd \t#\t"
      ps -p $x -o user,args --no-headers
   fi
  fi
done
echo -e "${red}Shared memory, Semaphores, and Message queues:${NC} "
ipcs -ma
echo -e "${red}Non ''sleeping'' process:${NC} "
ps -eo %cpu,%mem,pid,vsz,args,wchan | egrep -v '^ 0.0|^ 0.1'
echo -ne "\n${red}Nbr of openned files / max files open:${NC} "
cat /proc/sys/fs/file-nr | awk '{ print $1 "/" $3 } '
echo -e "\n${red}Memory usage in Megabytes:${NC} "
free -m
echo -en "\n${red}Server uptime:${NC} "
uptime

# EOF
