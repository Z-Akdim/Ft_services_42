FROM alpine:3.12.3

RUN apk add openrc
RUN apk add mariadb mariadb-common mariadb-client
# RUN rc-update add mariadb default
RUN rc-status && touch /run/openrc/softlevel

RUN echo "http://nl.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
RUN apk add telegraf
COPY ./srcs/telegraf.conf /etc/telegraf.conf

ADD ./srcs/run.sh ./run.sh
ADD ./srcs/wordpress.sql ./wordpress.sql

EXPOSE 3306

CMD sh run.sh



#       use wordpress
