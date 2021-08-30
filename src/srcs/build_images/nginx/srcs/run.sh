echo "Strating Telegraf ... "
rc-service telegraf start

echo "service nginx start ... "
rc-service nginx restart

sleep 2

while true;
do
        pgrep nginx;
        nginx_pg = $?;
        if [ $nginx_pg != 0 ]; then
                echo "nginx is not running !"
                exit 1
        fi
        pgrep telegraf;
        telegraf_pg = $?;
        if [ $telegraf_pg != 0 ]; then
                echo "telegraf is not running !"
                exit 1
        fi
        sleep 2
done

exit 0
