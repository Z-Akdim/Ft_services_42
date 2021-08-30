FROM alpine:3.12.3

RUN apk update && apk add openrc && apk add vsftpd
RUN rc-status && touch /run/openrc/softlevel 

RUN echo "http://nl.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories
RUN apk add telegraf
COPY ./srcs/telegraf.conf /etc/telegraf.conf

COPY ./srcs/vsftpd.conf /etc/vsftpd/vsftpd.conf
RUN echo -e "akdim\nakdim" | adduser testuser
RUN echo "testuser" | tee -a /etc/vsftpd.userlist
RUN apk add openssl
RUN openssl req -x509 -nodes -days 365 -subj "/C=CA/ST=QC/O=Company, Inc./CN=mydomain.com" -addext "subjectAltName=DNS:mydomain.com" -newkey rsa:2048 -keyout /etc/ssl/private/vsftpd.pem -out /etc/ssl/private/vsftpd.pem
COPY ./srcs/script.sh /script.sh
RUN chmod +x /script.sh
EXPOSE 21
CMD sh script.sh 

