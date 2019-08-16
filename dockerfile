FROM tomcat:8.0.50-jre8-slim
#ubuntu
MAINTAINER yangbin

ADD /lib/commons-pool2-2.3.jar $CATALINA_HOME/lib/
ADD /lib/tomcat-juli-8.0.50.jar $CATALINA_HOME/lib/
ADD /lib/jedis-2.8.1.jar $CATALINA_HOME/lib/
ADD /target/tomcat8-redis-session-manager-1.0.0.jar $CATALINA_HOME/lib/
COPY /src/main/resources/tomcat/context.xml $CATALINA_HOME/conf/context.xml
RUN ls $CATALINA_HOME/lib/

EXPOSE 8080
CMD ["catalina.sh", "run"]
