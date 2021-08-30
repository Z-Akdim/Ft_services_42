echo "Strating Telegraf ... "
rc-service telegraf start

echo "service nginx start ... "
rc-service nginx start

echo "service php-fpm7 start ... "
rc-service php-fpm7 start

sleep 2

while true;
do
        pgrep nginx
        nginx_pg = $?
        if [ $nginx_pg != 0 ]; then
                echo "nginx is not running !"
                exit 1
        fi
        pgrep php-fpm7
        php_pg = $?
        if [ $php_pg != 0 ]; then
                echo "php-fpm7 is not running !"
                exit 1
        fi
        pgrep telegraf
        telegraf_pg = $?
        if [ $telegraf_pg != 0 ]; then
		echo "telegraf is not running !"
		exit 1
        fi
        sleep 2
done

exit 0