#!/bin/sh
if [ `esxcli vm process list | grep "VMX Cartel ID" | awk '{print $2}' | wc -l` -gt 0 ]; then
 echo "`esxcli vm process list | grep "VMX Cartel ID" | awk '{print $2}' | wc -l`"
 echo "exit"
 exit;
else
 echo "`esxcli vm process list | grep "VMX Cartel ID" | awk '{print $2}' | wc -l`"
 echo "continue"
 continue;
fi;
for i in $( vim-cmd vmsvc/getallvms | grep Big | awk '{print $1}'
 ); do
  #echo item: $i
  vim-cmd vmsvc/power.on $i ; echo "$i is up"
done
#esxcli vm process list
echo "following VMs are running"; esxcli vm process list| grep -i "display name"|awk '{print $3}'
