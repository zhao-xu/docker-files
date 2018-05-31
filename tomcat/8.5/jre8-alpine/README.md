# tomcat

### Source
[https://github.com/zhao-xu/docker-files/tree/master/tomcat/8.5/jre8-alpine](https://github.com/zhao-xu/docker-files/tree/master/tomcat/8.5/jre8-alpine)

基于 [tomcat:8.5-jre8-alpine](https://hub.docker.com/_/tomcat/)  
* 修改了默认用户 `uid`/`gid`  
* 增加编译时时区选择 `TZ`  
* 取消 web.xml 变动时的自动重新部署  
* 允许 URL/queryString 中未转义的特殊字符  
[https://stackoverflow.com/questions/50361171/how-to-allow-character-in-urls-for-tomcat-8-5#answer-50377112](https://stackoverflow.com/questions/50361171/how-to-allow-character-in-urls-for-tomcat-8-5#answer-50377112)  
* 加强 tomcat 安全性设置  
  [https://github.com/iammyr/docs/blob/3e99a347971cfa337a1a175bf24ad792342b86be/tomcat/content.md#hardening-tomcat-security](https://github.com/iammyr/docs/blob/3e99a347971cfa337a1a175bf24ad792342b86be/tomcat/content.md#hardening-tomcat-security)  

### 参数
`uid` 运行 tomcat 的 uid，默认 `1000`  
`gid` 运行 tomcat 的 uid，默认 `1000`  
`TZ` 时区信息，默认 `Asia/Shanghai`  

### build
中国时区  
`docker build -t zxdkhb/tomcat:cn --build-arg uid=1000 --build-arg gid=1000 --build-arg TZ=Asia/Shanghai .`  
纽约时区  
`docker build -t zxdkhb/tomcat:us-ny --build-arg uid=1000 --build-arg gid=1000 --build-arg TZ=America/New_York .`  
