����tomcat�汾��apache-tomcat-8.0.33


��ʵ������tomcat����Redis��Session����������ʹ�ó������£�

	1��nginx + tomcatʵ�ָ��ؾ���
	
	
׼����
	
	commons-pool2-2.2.jar ------------------  �������ⲿjar
	jedis-2.8.1.jar ------------------------  �������ⲿjar
	tomcat-juli-8.0.33.jar -----------------  �������ⲿjar
	tomcat8-session-manager-1.0.0.jar ------  ����Ŀʵ��
	
	
1��������jar������tomcat/libĿ¼��
2���޸�tomcat/conf/context.xml
	<?xml version='1.0' encoding='utf-8'?>
	<Context>
	    <WatchedResource>WEB-INF/web.xml</WatchedResource>
	    <WatchedResource>${catalina.base}/conf/web.xml</WatchedResource>
		<Valve className="com.ynshun.tomcat8.redissession.RedisSessionHandlerValve" />
		<Manager className="com.ynshun.tomcat8.redissession.RedisSessionManager" host="${redis.server.host}" port="${redis.server.port}" database="${redis.database}" maxInactiveInterval="60" />
	</Context>
	
	˵����
		${redis.server.host}�� redis��������ַ��172.16.20.112��
		${redis.server.port}��redis����˿ڣ�6379��
		${redis.database}�� redis���ݿ⣨0 ~ 15��
		
		
�������ÿɲο���
	/tomcat8-redis-session-manager/src/main/resources