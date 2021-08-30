echo "Strating Telegraf ..."
rc-service telegraf start

echo "Starting influxdb ..."
rc-service influxdb start

sleep 2

while true;
do
    pgrep influxd
    influxdb_pg = $?
    if [ $influxdb_pg == 0 ]; then
		echo "InfluxDB is not running !"
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