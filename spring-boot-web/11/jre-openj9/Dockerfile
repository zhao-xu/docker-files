FROM adoptopenjdk:11-jre-openj9

ARG uid=1000
ARG gid=1000
ARG TZ=Asia/Shanghai

ENV LOGGING_PATH logs
ENV LOGGING_CONFIG file:/usr/local/app/logback-spring.xml
ENV TZ=$TZ
ENV APP_HOME /usr/local/app
WORKDIR $APP_HOME

COPY logback-spring.xml $APP_HOME/logback-spring.xml

RUN ln -sfn /usr/share/zoneinfo/$TZ /etc/localtime && \
    echo "$TZ" > /etc/timezone && \
    groupadd -g $gid app && \
    useradd -b $(dirname $APP_HOME) -u $uid -g app -s /bin/bash -M app && \
    mkdir -p $APP_HOME && chown -R root:app $APP_HOME && \
    mkdir $APP_HOME/logs && chown -R app:app logs

USER app
EXPOSE 8080
CMD ["java", "-jar", "app.jar"]
