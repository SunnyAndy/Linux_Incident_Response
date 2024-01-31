# Author Andy Lee  2021 11 27 
#!/bin/bash 

### export the   enviroment  at first beginning 

export PATH=$(pwd):$PATH 
A=`env | grep "PATH" | grep "$(pwd)"`     # make sure the current PATH is set to the enviroment  path 


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




utility="[ [[ acpid add-shell addgroup adduser adjtimex ar arch arp arping ascii ash awk base32 base64 basename bc blkdiscard blkid blockdev bootchartd brctl bunzip2 bzcat bzip2 cal cat chat chattr chgrp chmod chown chpasswd chpst chroot chrt chvt cksum clear cmp comm conspy cp cpio crc32 crond crontab cryptpw cttyhack cut date dc dd deallocvt delgroup deluser depmod devmem df dhcprelay diff dirname dmesg dnsd dnsdomainname dos2unix dpkg dpkg-deb du dumpkmap dumpleases echo ed egrep eject env envdir envuidgid expand expr factor fakeidentd fallocate false fatattr fbset fbsplash fdflush fdformat fdisk fgconsole fgrep find findfs flash_eraseall flash_lock flash_unlock flashcp flock fold free freeramdisk fsck fsck.minix fsfreeze fstrim fsync ftpd ftpget ftpput fuser getopt getty grep groups gunzip gzip halt hd hdparm head hexdump hexedit hostid hostname httpd hush hwclock i2cdump i2cget i2cset i2ctransfer id ifconfig ifenslave ifplugd inetd init inotifyd insmod install ionice iostat ip ipaddr ipcalc ipcrm ipcs iplink ipneigh iproute iprule iptunnel kbd_mode kill killall killall5 klogd last less link linux32 linux64 linuxrc ln loadfont loadkmap logger login logname losetup lpd lpq lpr ls lsattr lsmod lsof lspci lsscsi lsusb lzcat lzma lzop lzopcat makedevs makemime man md5sum mdev mesg microcom mim mkdir mkdosfs mke2fs mkfifo mkfs.ext2 mkfs.minix mkfs.reiser mkfs.vfat mknod mkpasswd mkswap mktemp modinfo modprobe more mount mountpoint mpstat mt mv nameif nbd-client nc netstat nice nl nmeter nohup nologin nproc nsenter nslookup ntpd nuke od openvt partprobe passwd paste patch pgrep pidof ping ping6 pipe_progress pivot_root pkill pmap popmaildir poweroff powertop printenv printf ps pscan pstree pwd pwdx raidautorun rdate rdev readlink readprofile realpath reboot reformime remove-shell renice reset resize resume rev rm rmdir rmmod route rpm rpm2cpio rtcwake run-init run-parts runlevel runsv runsvdir rx script scriptreplay sed sendmail seq setarch setconsole setfattr setfont setkeycodes setlogcons setpriv setserial setsid setuidgid sh sha1sum sha256sum sha3sum sha512sum showkey shred shuf slattach sleep smemcap softlimit sort split ssl_client start-stop-daemon stat strings stty su sulogin sum sv svc svlogd svok swapoff swapon switch_root sync sysctl syslogd tac tail tar taskset tc tcpsvd tee telnet telnetd test tftp tftpd time timeout top touch tr traceroute traceroute6 true truncate ts tty ttysize tunctl tune2fs ubiattach ubidetach ubimkvol ubirename ubirmvol ubirsvol ubiupdatevol udhcpc udhcpc6 udhcpd udpsvd uevent umount uname uncompress unexpand uniq unix2dos unlink unlzma unlzop unshare unxz unzip uptime users usleep uudecode uuencode vconfig vi vlock volname w wall watch watchdog wc wget which who whoami whois xargs xxd xz xzcat yes zcat zcip"

for i in  $utility        #     1 3 5 7 9 11 13 15 17 19  
do  
       alias $i="$BUSY_BOX_CMD  $i"
done 


#which dd

dd --help


which busybox


Start_Time=` date +%Y_%m%d_%H_%M_%S`
Machine_Info=` hostname -s`
echo $Machine_Info
echo $Start_Time
 mkdir $Machine_Info"_"$Start_Time

OS_Type=` uname -a `

echo "OS information gathering "
  printf  "OS type , " >> $Machine_Info"_"$Start_Time/Processing_Details.txt
  uname -a   >>$Machine_Info"_"$Start_Time/Processing_Details.txt


echo "computer name gathering "
  printf  "Computer Name , " >> $Machine_Info"_"$Start_Time/Processing_Details.txt
  hostname  >> $Machine_Info"_"$Start_Time/Processing_Details.txt


echo "Time Stamp "
  printf  "Time Stamp , " >> $Machine_Info"_"$Start_Time/Processing_Details.txt
  echo $Start_Time >> $Machine_Info"_"$Start_Time/Processing_Details.txt


## HIDDEN Searching
echo "HIDDEN Searching "
  echo   " Hidden Files " >> $Machine_Info"_"$Start_Time/HIDDEN_FILE.txt
 find ./ -name ".*"   >> $Machine_Info"_"$Start_Time/HIDDEN_FILE.txt


## Basic Informaiton
  echo   " date " >> $Machine_Info"_"$Start_Time/date.txt
 date >> $Machine_Info"_"$Start_Time/date.txt

 echo "hostname"
 hostname >>$Machine_Info"_"$Start_Time/hostname.txt

 echo "who"
 who >> $Machine_Info"_"$Start_Time/Logged_In_Users.txt

 echo "ps aux --forest"
 ps aux --forest >> $Machine_Info"_"$Start_Time/List_of_Running_Processes.txt

 echo "pstree -ah "
 pstree -ah   >> $Machine_Info"_"$Start_Time/Process_tree_and_arguments.txt

 echo "mount"
 mount >> $Machine_Info"_"$Start_Time/Mounted_items.txt


 echo "uptime"
 uptime >> $Machine_Info"_"$Start_Time/System_uptime.txt


 echo "prinenv"
 printenv >> $Machine_Info"_"$Start_Time/System_environment_detailed.txt

 echo "cat /proc/version"
 cat /proc/version >> $Machine_Info"_"$Start_Time/OS_kernel_version.txt

 echo "top -n 1 -b"
 top -n 1 -b >> $Machine_Info"_"$Start_Time/Process_memory_usage.txt


## memory info ####


# echo "netstat"
# netstat -anp >> $Machine_Info"_"$Start_Time/netstat_current_connections.txt

## net work  information


 echo "netstat"
 netstat -anp >> $Machine_Info"_"$Start_Time/netstat_current_connections.txt

 echo "all  adapters"
 ip link   >> $Machine_Info"_"$Start_Time/PROMISC_adapter_check.txt

 echo "ss"
_ ss >> $Machine_Info"_"$Start_Time/socket_statistics.txt

 echo "lsof -i -n -P"
 lsof -i -n -P>> $Machine_Info"_"$Start_Time/lsof_network_connections.txt

 echo "netstat -rn"
 netstat -rn >> $Machine_Info"_"$Start_Time/Routing_table.txt

 echo "arp -an"
 arp -an >> $Machine_Info"_"$Start_Time/ARP_table.txt

 echo "ifconfig -a"
 ifconfig -a >> $Machine_Info"_"$Start_Time/Network_interface_info.txt

 echo "cat /etc/hosts.allow"
 cat /etc/hosts.allow >> $Machine_Info"_"$Start_Time/Hosts_allow.txt

 echo "cat /etc/hosts.deny"
 cat /etc/hosts.deny >> $Machine_Info"_"$Start_Time/Hosts_deny.txt




##  service
#This needs to be flavor specific
 echo "service --status-all"
_  service --status-all  >> $Machine_Info"_"$Start_Time/Running_services.txt

 echo "lsmod | head"
 lsmod | head >> $Machine_Info"_"$Start_Time/Loaded_modules.txt

 echo "last"
 last >> $Machine_Info"_"$Start_Time/Last_logins.txt

 echo "lastb"
 lastb >> $Machine_Info"_"$Start_Time/Lastb.txt


## Userinformaitonm

 echo "cat /etc/passwd"
 cat /etc/passwd >> $Machine_Info"_"$Start_Time/passwd.txt

 echo "cat /etc/group"
 cat /etc/group >> $Machine_Info"_"$Start_Time/group.txt

 echo "lastlog"
_  lastlog >> $Machine_Info"_"$Start_Time/Last_login_per_user.txt

 echo "whoami"
 whoami >> $Machine_Info"_"$Start_Time/whoami.txt

 echo "logname"
 logname >> $Machine_Info"_"$Start_Time/logname.txt

 echo "id"
 id >> $Machine_Info"_"$Start_Time/id.txt

for i in `ls /home/`
do
          cat /home/$i/.bash_history >> $Machine_Info"_"$Start_Time/home-$i-bash_History.txt
         echo "cat $i bash_history"
done

 echo "authorized_ket"
 find ./ -name authorized_keys >> $Machine_Info"_"$Start_Time/auth_key.txt



#LOGS
if [ ! -d $Machine_Info"_"$Start_Time/var/log/ ]; then
	 mkdir -p  $Machine_Info"_"$Start_Time/var/log/
	 cp -r   /var/log/*.log* $Machine_Info"_"$Start_Time/var/log/
else
	 cp -r   /var/log/*.log* $Machine_Info"_"$Start_Time/var/log
fi


if [ ! -d $Machine_Info"_"$Start_Time/etc/cron/ ]; then
	 mkdir  -p $Machine_Info"_"$Start_Time/etc/cron/
	 cp -r   /etc/cron*   $Machine_Info"_"$Start_Time/etc/cron/
else

	 cp -r   /etc/cron*   $Machine_Info"_"$Start_Time/etc/cron/
fi





