FROM mhart/alpine-node:latest
MAINTAINER nathan-owen

ADD src/ /root/

RUN apk add --update unzip wget supervisor nano 

RUN mv /root/supervisord.conf /etc/supervisord.conf && \
	mkdir /app /config && \
	wget --no-check-certificate https://github.com/nathan-owen/Radarr-Telegram-Bot/archive/master.zip -P /app && \
	unzip /app/master.zip -d /app && \
	rm /app/master.zip

RUN cd /app/Radarr-Telegram-Bot-master && npm install

RUN apk del unzip wget

VOLUME /config

CMD ["/bin/ash","/root/startup.sh"]
