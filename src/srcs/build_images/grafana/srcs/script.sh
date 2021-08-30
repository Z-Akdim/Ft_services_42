 echo "Strating Telegraf ... "
rc-service telegraf start

echo "Starting the grafana-server binary ..."
cd grafana && cd bin && ./grafana-server

while sleep 2;
    do
        pgrep telegraf
        telegraf_pg = $?
        if [ $telegraf_pg != 0 ]; then
            echo "Telegraf service is not running ..."
            exit 1
        fi
        pgrep grafana-server
        grafana_pg = $?
        if [ $grafana_pg != 0 ]; then
            echo "Grafana server is not running ..."
            exit 1
        fi
    done
exit 0