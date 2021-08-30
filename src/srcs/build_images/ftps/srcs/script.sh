echo "Strating Telegraf ... "
rc-service telegraf start

echo "service vsftpd start ... "
rc-service vsftpd start

sleep 2

while true;
do 
	pgrep vsftpd
	vsftpd_pg = $?
    if [ $vsftpd_pg != 0 ];then
		echo "vsftpd is not running !"
		exit 1
	  else
		echo "vsftpd is running !"
    fi
    pgrep telegraf
    telegraf_pg = $?
    if [ $telegraf_pg != 0 ];then
		echo "telegraf is not running !"
		exit 1
	else
		echo "telegraf is running !"
    fi
    sleep 2
done

exit 0