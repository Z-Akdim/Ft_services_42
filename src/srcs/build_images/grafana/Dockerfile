FROM alpine:3.12.3
RUN apk update
RUN apk add wget openrc libc6-compat
RUN rc-status && touch /run/openrc/softlevel
RUN wget https://dl.grafana.com/oss/release/grafana-7.5.2.linux-amd64.tar.gz
RUN tar -zxvf grafana-7.5.2.linux-amd64.tar.gz
RUN mv grafana-7.5.2 grafana
RUN rm -rf grafana-7.5.2.linux-amd64.tar.gz
#install telegraf
RUN echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
RUN apk add telegraf
COPY ./srcs/telegraf.conf /etc/telegraf.conf

ADD ./srcs/grafana.db /grafana/data/grafana.db

COPY ./srcs/script.sh /
RUN chmod +x /script.sh
CMD /script.sh
EXPOSE 3000