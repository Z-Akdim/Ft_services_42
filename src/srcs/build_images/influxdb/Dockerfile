FROM alpine:3.12.3

RUN apk update && apk add openrc
RUN apk add influxdb
RUN rc-status && touch /run/openrc/softlevel 

RUN echo "http://nl.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
RUN apk add telegraf
COPY ./srcs/telegraf.conf /etc/telegraf.conf

COPY ./srcs/script.sh /script.sh
RUN chmod +x /script.sh

EXPOSE 8086

CMD sh script.sh



