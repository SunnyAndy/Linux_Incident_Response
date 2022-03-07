# add this in the .bashrc and soruce bashrc
utility="[ [[ acpid add-shell addgroup adduser adjtimex ar arch arp arping ascii ash awk base32 base64 basename bc blkdiscard blkid blockdev bootchartd brctl bunzip2 bzcat bzip2 cal cat chat chattr chgrp chmod chown chpasswd chpst chroot chrt chvt cksum clear cmp comm conspy cp cpio crc32 crond crontab cryptpw cttyhack cut date dc dd deallocvt delgroup deluser depmod devmem df dhcprelay diff dirname dmesg dnsd dnsdomainname dos2unix dpkg dpkg-deb du dumpkmap dumpleases echo ed egrep eject env envdir envuidgid expand expr factor fakeidentd fallocate false fatattr fbset fbsplash fdflush fdformat fdisk fgconsole fgrep find findfs flash_eraseall flash_lock flash_unlock flashcp flock fold free freeramdisk fsck fsck.minix fsfreeze fstrim fsync ftpd ftpget ftpput fuser getopt getty grep groups gunzip gzip halt hd hdparm head hexdump hexedit hostid hostname httpd hush hwclock i2cdump i2cget i2cset i2ctransfer id ifconfig ifenslave ifplugd inetd init inotifyd insmod install ionice iostat ip ipaddr ipcalc ipcrm ipcs iplink ipneigh iproute iprule iptunnel kbd_mode kill killall killall5 klogd last less link linux32 linux64 linuxrc ln loadfont loadkmap logger login logname losetup lpd lpq lpr ls lsattr lsmod lsof lspci lsscsi lsusb lzcat lzma lzop lzopcat makedevs makemime man md5sum mdev mesg microcom mim mkdir mkdosfs mke2fs mkfifo mkfs.ext2 mkfs.minix mkfs.reiser mkfs.vfat mknod mkpasswd mkswap mktemp modinfo modprobe more mount mountpoint mpstat mt mv nameif nbd-client nc netstat nice nl nmeter nohup nologin nproc nsenter nslookup ntpd nuke od openvt partprobe passwd paste patch pgrep pidof ping ping6 pipe_progress pivot_root pkill pmap popmaildir poweroff powertop printenv printf ps pscan pstree pwd pwdx raidautorun rdate rdev readlink readprofile realpath reboot reformime remove-shell renice reset resize resume rev rm rmdir rmmod route rpm rpm2cpio rtcwake run-init run-parts runlevel runsv runsvdir rx script scriptreplay sed sendmail seq setarch setconsole setfattr setfont setkeycodes setlogcons setpriv setserial setsid setuidgid sh sha1sum sha256sum sha3sum sha512sum showkey shred shuf slattach sleep smemcap softlimit sort split ssl_client start-stop-daemon stat strings stty su sulogin sum sv svc svlogd svok swapoff swapon switch_root sync sysctl syslogd tac tail tar taskset tc tcpsvd tee telnet telnetd test tftp tftpd time timeout top touch tr traceroute traceroute6 true truncate ts tty ttysize tunctl tune2fs ubiattach ubidetach ubimkvol ubirename ubirmvol ubirsvol ubiupdatevol udhcpc udhcpc6 udhcpd udpsvd uevent umount uname uncompress unexpand uniq unix2dos unlink unlzma unlzop unshare unxz unzip uptime users usleep uudecode uuencode vconfig vi vlock volname w wall watch watchdog wc wget which who whoami whois xargs xxd xz xzcat yes zcat zcip"

for i in  $utility      
do
        alias $i="/home/test/Downloads/busybox  '$i'"
 
done



