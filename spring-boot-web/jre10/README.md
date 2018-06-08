# spring-boot-web

### Source
[https://github.com/zhao-xu/docker-files/tree/master/spring-boot-web/10-jre](https://github.com/zhao-xu/docker-files/tree/master/spring-boot-web/10-jre)

基于 [openjdk:10-jre](https://hub.docker.com/_/openjdk/)  
* 修改了默认用户 `uid`/`gid`  
* 增加编译时时区选择 `TZ`  
* logback 日志配置 size/time based rolling  

### build 参数
`uid` 运行 tomcat 的 uid，默认 `1000`  
`gid` 运行 tomcat 的 uid，默认 `1000`  
`TZ` 时区信息，默认 `Asia/Shanghai`  

### 运行环境
`APP_HOME=/usr/local/app` 程序启动目录  
`LOGGING_PATH=logs` logback 日志输出目录 `/usr/local/app/logs`  
`LOGGING_CONFIG=file:/usr/local/app/logback-spring.xml` logback 配置文件  
`EXPOSE 8080` web 端口  
`java -jar /usr/local/app/app.jar` 默认启动应用  

### Example
```console
docker run -d \
   --publish 8080:8080 \
   --volume /path-to-your/app.jar:/usr/local/app/app.jar:ro \
   --volume /path-to-your/application.properties:/usr/local/app/application.properties:ro \
   --volume /path-to-your/logs:/usr/local/app/logs:Z \
   zxdkhb/spring-boot-web:10-jre
```

### build
自定义时区  
纽约时区  
`docker build -t zxdkhb/spring-boot-web:10-jre-USA-new-york --build-arg TZ=America/New_York .`  
