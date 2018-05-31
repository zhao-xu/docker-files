FROM openjdk:8-jre-alpine

ARG uid=1000
ARG gid=1000
ARG TZ=Asia/Shanghai

ENV LOGGING_PATH logs
ENV LOGGING_CONFIG file:/usr/local/app/logback-spring.xml
ENV TZ=$TZ
ENV APP_HOME /usr/local/app
WORKDIR $APP_HOME

COPY logback-spring.xml $APP_HOME/logback-spring.xml

RUN apk add --no-cache tzdata && \
    ln -sfn /usr/share/zoneinfo/$TZ /etc/localtime && \
    echo "$TZ" > /etc/timezone && \
    addgroup -g $gid app && \
    adduser -h $APP_HOME -u $uid -G app -s /bin/sh -D app && \
    mkdir -p $APP_HOME && chown -R root:app $APP_HOME && \
    mkdir $APP_HOME/logs && chown -R app:app logs

USER app
EXPOSE 8080
CMD ["java", "-jar", "app.jar"]

