FROM tomcat:8.5.33-jre8-alpine

ARG uid=1000
ARG gid=1000
ARG TZ=Asia/Shanghai

ENV TZ=$TZ

RUN apk add --no-cache tzdata && \
    ln -sfn /usr/share/zoneinfo/$TZ /etc/localtime && \
    echo "$TZ" > /etc/timezone

COPY _bashrc $CATALINA_HOME/.bashrc
COPY _inputrc $CATALINA_HOME/.inputrc

RUN sed -i 's|<WatchedResource>|<!--<WatchedResource>|' $CATALINA_HOME/conf/context.xml && \
    sed -i 's|</WatchedResource>|</WatchedResource>-->|' $CATALINA_HOME/conf/context.xml && \
    sed -i '/<Connector port="8080" protocol="HTTP\/1.1"/{n;n;s/redirectPort="8443" \/>/redirectPort="8443" relaxedPathChars="[]|" relaxedQueryChars="[]|{}^\&#x5c;\&#x60;\&quot;\&lt;\&gt;" \/>/}' $CATALINA_HOME/conf/server.xml && \
    sed -i 's|prefix="localhost_access_log" suffix=".txt"|prefix="localhost_access_log" suffix=".txt" conditionUnless="skipAccessLog"|' $CATALINA_HOME/conf/server.xml && \
    sed -i 's|handlers = 1catalina.org.apache.juli.AsyncFileHandler, 2localhost.org.apache.juli.AsyncFileHandler, 3manager.org.apache.juli.AsyncFileHandler, 4host-manager.org.apache.juli.AsyncFileHandler, java.util.logging.ConsoleHandler|handlers = 1catalina.org.apache.juli.AsyncFileHandler, 2localhost.org.apache.juli.AsyncFileHandler|' $CATALINA_HOME/conf/logging.properties && \
    sed -i 's|.handlers = 1catalina.org.apache.juli.AsyncFileHandler, java.util.logging.ConsoleHandler|.handlers = 1catalina.org.apache.juli.AsyncFileHandler|' $CATALINA_HOME/conf/logging.properties && \
    mkdir -p $CATALINA_HOME/lib/org/apache/catalina/util && \
    echo 'server.info=Apache Tomcat' >> $CATALINA_HOME/lib/org/apache/catalina/util/ServerInfo.properties && \
    addgroup -g $gid tomcat && \
    adduser -h $CATALINA_HOME -u $uid -G tomcat -s /sbin/nologin -D tomcat && \
    rm -rf $CATALINA_HOME/webapps/* && rm -rf $CATALINA_HOME/server/webapps/* && \
    rm -rf $CATALINA_HOME/conf/Catalina/localhost/host-manager.xml && \
    rm -rf $CATALINA_HOME/conf/Catalina/localhost/manager.xml && \
    chown -R root:tomcat $CATALINA_HOME && chmod -R 550 $CATALINA_HOME && \
    chown -R tomcat:tomcat $CATALINA_HOME/conf && chown -R tomcat:tomcat $CATALINA_HOME/logs && \
    chown -R tomcat:tomcat $CATALINA_HOME/work && chmod 570 $CATALINA_HOME/bin/catalina.sh && \
    chmod -R 500 $CATALINA_HOME/conf && chmod -R 300 $CATALINA_HOME/logs && \
    chmod -R 770 $CATALINA_HOME/work && chmod -R 550 $CATALINA_HOME/webapps/ && \
    chmod -R 600 $CATALINA_HOME/temp

USER tomcat

