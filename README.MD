生产tomcat版本：apache-tomcat-8.0.33


本实例用于tomcat基于Redis的Session共享，具体使用场景如下：

	1、nginx + tomcat实现负载均衡
	
	
准备：
	
	commons-pool2-2.2.jar ------------------  第三方外部jar
	jedis-2.8.1.jar ------------------------  第三方外部jar
	tomcat-juli-8.0.33.jar -----------------  第三方外部jar
	tomcat8-session-manager-1.0.0.jar ------  本项目实例
	
	
1、将以上jar拷贝至tomcat/lib目录中
2、修改tomcat/conf/context.xml
	<?xml version='1.0' encoding='utf-8'?>
	<Context>
	    <WatchedResource>WEB-INF/web.xml</WatchedResource>
	    <WatchedResource>${catalina.base}/conf/web.xml</WatchedResource>
		<Valve className="com.ynshun.tomcat8.redissession.RedisSessionHandlerValve" />
		<Manager className="com.ynshun.tomcat8.redissession.RedisSessionManager" host="${redis.server.host}" port="${redis.server.port}" database="${redis.database}" maxInactiveInterval="60" />
	</Context>
	
	说明：
		${redis.server.host}： redis服务器地址（172.16.20.112）
		${redis.server.port}：redis服务端口（6379）
		${redis.database}： redis数据库（0 ~ 15）
		
		
具体配置可参考：
	/tomcat8-redis-session-manager/src/main/resources