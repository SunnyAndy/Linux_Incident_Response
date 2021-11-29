# Author Andy Lee  2021 11 27 
#!/bin/bash 

### export the   enviroment  at first beginning 

export PATH=$(pwd):$PATH 
A=`env | grep "PATH" | grep "$(pwd)"`

System_Root=$PWD

if [ "$A" = "" ];then 
	echo "enviroment setting fails"
	exit
fi


#  the following is made for  fetch the  portable busybox binary 

cd $System_Root

BUSY_BOX=busybox

BUSY_BOX_CMD=$System_Root/busybox

if [ ! -f $BUSY_BOX_CMD ]; then 
	busybox=`wget -O $BUSY_BOX https://busybox.net/downloads/binaries/1.30.0-i686/busybox`
	chmod 777 $BUSY_BOX
fi


which busybox


Start_Time=`$BUSY_BOX_CMD date +%Y_%m%d_%H_%M_%S`
Machine_Info=`$BUSY_BOX_CMD hostname -s`
echo $Machine_Info
echo $Start_Time
$BUSY_BOX_CMD mkdir $Machine_Info"_"$Start_Time

OS_Type=`$BUSY_BOX_CMD uname -a `

echo "OS information gathering "
$BUSY_BOX_CMD  printf  "OS type , " >> $Machine_Info"_"$Start_Time/Processing_Details.txt
$BUSY_BOX_CMD  uname -a   >>$Machine_Info"_"$Start_Time/Processing_Details.txt 


echo "computer name gathering "
$BUSY_BOX_CMD  printf  "Computer Name , " >> $Machine_Info"_"$Start_Time/Processing_Details.txt
$BUSY_BOX_CMD  hostname  >> $Machine_Info"_"$Start_Time/Processing_Details.txt


echo "Time Stamp "
$BUSY_BOX_CMD  printf  "Time Stamp , " >> $Machine_Info"_"$Start_Time/Processing_Details.txt
$BUSY_BOX_CMD  echo $Start_Time >> $Machine_Info"_"$Start_Time/Processing_Details.txt


## HIDDEN Searching 
echo "HIDDEN Searching "
$BUSY_BOX_CMD  echo   " Hidden Files " >> $Machine_Info"_"$Start_Time/HIDDEN_FILE.txt
$BUSY_BOX_CMD find ./ -name ".*"   >> $Machine_Info"_"$Start_Time/HIDDEN_FILE.txt


## Basic Informaiton 
$BUSY_BOX_CMD  echo   " date " >> $Machine_Info"_"$Start_Time/date.txt
$BUSY_BOX_CMD date >> $Machine_Info"_"$Start_Time/date.txt

$BUSY_BOX_CMD echo "hostname"
$BUSY_BOX_CMD hostname >>$Machine_Info"_"$Start_Time/hostname.txt

$BUSY_BOX_CMD echo "who"
$BUSY_BOX_CMD who >> $Machine_Info"_"$Start_Time/Logged_In_Users.txt

$BUSY_BOX_CMD echo "ps aux --forest"
$BUSY_BOX_CMD_ ps aux --forest >> $Machine_Info"_"$Start_Time/List_of_Running_Processes.txt

$BUSY_BOX_CMD echo "pstree -ah "
$BUSY_BOX_CMD_ pstree -ah   >> $Machine_Info"_"$Start_Time/Process_tree_and_arguments.txt

$BUSY_BOX_CMD echo "mount"
$BUSY_BOX_CMD mount >> $Machine_Info"_"$Start_Time/Mounted_items.txt


$BUSY_BOX_CMD echo "uptime"
$BUSY_BOX_CMD uptime >> $Machine_Info"_"$Start_Time/System_uptime.txt


$BUSY_BOX_CMD echo "prinenv"
$BUSY_BOX_CMD printenv >> $Machine_Info"_"$Start_Time/System_environment_detailed.txt

$BUSY_BOX_CMD echo "cat /proc/version"
$BUSY_BOX_CMD cat /proc/version >> $Machine_Info"_"$Start_Time/OS_kernel_version.txt

$BUSY_BOX_CMD echo "top -n 1 -b"
$BUSY_BOX_CMD top -n 1 -b >> $Machine_Info"_"$Start_Time/Process_memory_usage.txt


## memory info #### 


#$BUSY_BOX_CMD echo "netstat"
#$BUSY_BOX_CMD netstat -anp >> $Machine_Info"_"$Start_Time/netstat_current_connections.txt

## net work  information 


$BUSY_BOX_CMD echo "netstat"
$BUSY_BOX_CMD netstat -anp >> $Machine_Info"_"$Start_Time/netstat_current_connections.txt

$BUSY_BOX_CMD echo "all  adapters"
$BUSY_BOX_CMD ip link   >> $Machine_Info"_"$Start_Time/PROMISC_adapter_check.txt

$BUSY_BOX_CMD echo "ss"
$BUSY_BOX_CMD_ ss >> $Machine_Info"_"$Start_Time/socket_statistics.txt

$BUSY_BOX_CMD echo "lsof -i -n -P"
$BUSY_BOX_CMD lsof -i -n -P>> $Machine_Info"_"$Start_Time/lsof_network_connections.txt

$BUSY_BOX_CMD echo "netstat -rn"
$BUSY_BOX_CMD netstat -rn >> $Machine_Info"_"$Start_Time/Routing_table.txt

$BUSY_BOX_CMD echo "arp -an"
$BUSY_BOX_CMD arp -an >> $Machine_Info"_"$Start_Time/ARP_table.txt

$BUSY_BOX_CMD echo "ifconfig -a"
$BUSY_BOX_CMD ifconfig -a >> $Machine_Info"_"$Start_Time/Network_interface_info.txt

$BUSY_BOX_CMD echo "cat /etc/hosts.allow"
$BUSY_BOX_CMD cat /etc/hosts.allow >> $Machine_Info"_"$Start_Time/Hosts_allow.txt

$BUSY_BOX_CMD echo "cat /etc/hosts.deny"
$BUSY_BOX_CMD cat /etc/hosts.deny >> $Machine_Info"_"$Start_Time/Hosts_deny.txt




##  service 
#This needs to be flavor specific
$BUSY_BOX_CMD echo "service --status-all"
$BUSY_BOX_CMD_  service --status-all  >> $Machine_Info"_"$Start_Time/Running_services.txt

$BUSY_BOX_CMD echo "lsmod | head"
$BUSY_BOX_CMD lsmod | head >> $Machine_Info"_"$Start_Time/Loaded_modules.txt

$BUSY_BOX_CMD echo "last"
$BUSY_BOX_CMD last >> $Machine_Info"_"$Start_Time/Last_logins.txt



## Userinformaitonm 

$BUSY_BOX_CMD echo "cat /etc/passwd"
$BUSY_BOX_CMD cat /etc/passwd >> $Machine_Info"_"$Start_Time/passwd.txt

$BUSY_BOX_CMD echo "cat /etc/group"
$BUSY_BOX_CMD cat /etc/group >> $Machine_Info"_"$Start_Time/group.txt

$BUSY_BOX_CMD echo "lastlog"
$BUSY_BOX_CMD_  lastlog >> $Machine_Info"_"$Start_Time/Last_login_per_user.txt

$BUSY_BOX_CMD echo "whoami"
$BUSY_BOX_CMD whoami >> $Machine_Info"_"$Start_Time/whoami.txt

$BUSY_BOX_CMD echo "logname"
$BUSY_BOX_CMD logname >> $Machine_Info"_"$Start_Time/logname.txt

$BUSY_BOX_CMD echo "id"
$BUSY_BOX_CMD id >> $Machine_Info"_"$Start_Time/id.txt

for i in `ls /home/`
do
         $BUSY_BOX_CMD cat /home/$i/.bash_history >> $Machine_Info"_"$Start_Time/home-$i-bash_History.txt
         echo "cat $i bash_history"
done

$BUSY_BOX_CMD find ./ -name authorized_keys >> $Machine_Info"_"$Start_Time/auth_key.txt
$BUSY_BOX_CMD echo "authorized_ket"



#LOGS 
if [ ! -d $Machine_Info"_"$Start_Time/var/log/ ]; then
        $BUSY_BOX_CMD mkdir -p  $Machine_Info"_"$Start_Time/var/log/
        $BUSY_BOX_CMD cp -r   /var/log/*.log* $Machine_Info"_"$Start_Time/var/log/
else
        $BUSY_BOX_CMD cp -r   /var/log/*.log* $Machine_Info"_"$Start_Time/var/log
fi


if [ ! -d $Machine_Info"_"$Start_Time/etc/cron/ ]; then
        $BUSY_BOX_CMD mkdir  -p $Machine_Info"_"$Start_Time/etc/cron/
        $BUSY_BOX_CMD cp -r   /etc/cron*   $Machine_Info"_"$Start_Time/etc/cron/
else

        $BUSY_BOX_CMD cp -r   /etc/cron*   $Machine_Info"_"$Start_Time/etc/cron/
fi



