FROM openjdk:15-jdk-alpine
MAINTAINER tom@wurps.de

WORKDIR /app/

# Copy files into container
COPY ./docker/crontab /etc/cron/crontab
COPY ./docker/entrypoint.sh /app/
COPY ./docker/send_message.sh /app/

# Configure timezone, cronjob and signal
RUN apk add tzdata \
    && cp /usr/share/zoneinfo/Europe/Berlin /etc/localtime \
    && echo "Europe/Berlin" > /etc/timezone \
    && apk del tzdata \
    && wget https://github.com/AsamK/signal-cli/releases/download/v0.7.1/signal-cli-0.7.1.tar.gz \
    && tar -xzvf signal-cli-0.7.1.tar.gz \
    && rm signal-cli-0.7.1.tar.gz \
    && crontab /etc/cron/crontab \
    && chmod +x /app/*.sh

ENTRYPOINT ["sh", "/app/entrypoint.sh"]
