   #!/bin/sh
   #Author Sudheer Kondla Date 09/01/2010
    if [ `esxcli vm process list | grep "VMX Cartel ID" | awk '{print $2}' | wc -l` -gt 0 ]; then
    	echo "`esxcli vm process list | grep "VMX Cartel ID" | awk '{print $2}' | wc -l`"
    	echo "continue"
    	continue;
    else
        echo "`esxcli vm process list | grep "VMX Cartel ID" | awk '{print $2}' | wc -l`"
        echo "exit"
    	exit;
    fi;		
    for i in $( vim-cmd vmsvc/getallvms | grep Big | awk '{print $1}'
     ); do
      #echo item: $i
      vim-cmd vmsvc/power.off $i; echo "$i is powered off"
    done
    esxcli vm process list
