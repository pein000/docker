##����redis��Ⱥ������Ⱥ�ǻ��ڶ˿ںŵ�redis cluster��

##��������centos
FROM centos


##��������Ϣ
MAINTAINER qiuwei "vesalqiu_000@163.com"


##��װ����

#��װwget
RUN yum -y install wget
#��װmake
RUN yum -y install gcc automake autoconf libtool make
#��װvim
RUN yum -y install vim*
#��װruby
RUN yum -y install ruby
RUN yum -y install rubygems
#��װ���繤��
RUN yum -y install net-tools
#ȱ��redis��ruby�Ľӿڣ�ʹ��gem ��װ
RUN gem install redis
#��װdos2unix �û�startup.shʹ��windowд�룬��linuxִ��ʱ�����޷�ִ�е����⡣
RUN yum -y install dos2unix
#�½��û�
RUN useradd redis
#�л���redis�û�Ŀ¼
WORKDIR /home/redis_cluster
#����reids 3.0
RUN wget http://download.redis.io/releases/redis-3.0.6.tar.gz
#��ѹ
RUN tar -zxvf redis-3.0.6.tar.gz
#�л���redisĿ¼
WORKDIR redis-3.0.6
#Դ�밲װredis���ɹ�����srcĿ¼�д���redis-cli��redis-server��
RUN make
#����Ŀ¼
RUN mkdir -p /home/redis_cluster/7000/bin /home/redis_cluster/7001/bin /home/redis_cluster/7002/bin /home/redis_cluster/7003/bin /home/redis_cluster/7004/bin /home/redis_cluster/7005/bin
RUN mkdir -p /home/redis_cluster/7000/conf /home/redis_cluster/7001/conf /home/redis_cluster/7002/conf /home/redis_cluster/7003/conf /home/redis_cluster/7004/conf /home/redis_cluster/7005/conf
RUN mkdir -p /home/redis_cluster/7000/logs /home/redis_cluster/7001/logs /home/redis_cluster/7002/logs /home/redis_cluster/7003/logs /home/redis_cluster/7004/logs /home/redis_cluster/7005/logs
#��redis-trib.rb���õ�redis_clusterĿ¼��
RUN cp /home/redis/redis-3.0.6/src/redis-trib.rb /home/redis_cluster/
#����ɹ���redis���򣬷��õ�����Ŀ¼��
RUN cp -R /home/redis/redis-3.0.6/src/redis-cli /home/redis/redis-3.0.6/src/redis-server /home/redis/redis-3.0.6/src/redis-benchmark  /home/redis/redis-3.0.6/src/redis-sentinel /home/redis_cluster/7000/bin/
RUN cp -R /home/redis/redis-3.0.6/src/redis-cli /home/redis/redis-3.0.6/src/redis-server /home/redis/redis-3.0.6/src/redis-benchmark  /home/redis/redis-3.0.6/src/redis-sentinel /home/redis_cluster/7001/bin/
RUN cp -R /home/redis/redis-3.0.6/src/redis-cli /home/redis/redis-3.0.6/src/redis-server /home/redis/redis-3.0.6/src/redis-benchmark  /home/redis/redis-3.0.6/src/redis-sentinel /home/redis_cluster/7002/bin/
RUN cp -R /home/redis/redis-3.0.6/src/redis-cli /home/redis/redis-3.0.6/src/redis-server /home/redis/redis-3.0.6/src/redis-benchmark  /home/redis/redis-3.0.6/src/redis-sentinel /home/redis_cluster/7003/bin/
RUN cp -R /home/redis/redis-3.0.6/src/redis-cli /home/redis/redis-3.0.6/src/redis-server /home/redis/redis-3.0.6/src/redis-benchmark  /home/redis/redis-3.0.6/src/redis-sentinel /home/redis_cluster/7004/bin/
RUN cp -R /home/redis/redis-3.0.6/src/redis-cli /home/redis/redis-3.0.6/src/redis-server /home/redis/redis-3.0.6/src/redis-benchmark  /home/redis/redis-3.0.6/src/redis-sentinel /home/redis_cluster/7005/bin/
#�������ļ�redis.conf�����õ�����Ŀ¼��
RUN cp /home/redis/redis-3.0.6/redis.conf /home/redis_cluster/7000/conf/
RUN cp /home/redis/redis-3.0.6/redis.conf /home/redis_cluster/7001/conf/
RUN cp /home/redis/redis-3.0.6/redis.conf /home/redis_cluster/7002/conf/
RUN cp /home/redis/redis-3.0.6/redis.conf /home/redis_cluster/7003/conf/
RUN cp /home/redis/redis-3.0.6/redis.conf /home/redis_cluster/7004/conf/
RUN cp /home/redis/redis-3.0.6/redis.conf /home/redis_cluster/7005/conf/
#�޸ĸ��������ļ������ݡ���redis.conf�����ü�Ⱥ����
RUN sed -i 's/port.*$/port 7000/g' /home/redis_cluster/7000/conf/redis.conf && \
		sed -i 's/logfile.*$/logfile "\/home\/redis_cluster\/7000\/logs\/redis.log"/g' /home/redis_cluster/7000/conf/redis.conf && \
		sed -i 's/# cluster-enabled yes/cluster-enabled yes/g' /home/redis_cluster/7000/conf/redis.conf  && \
		sed -i 's/# cluster-config-file.*$/cluster-config-file /home/redis_cluster/7000/conf/nodes_7000.conf/g' /home/redis_cluster/7000/conf/redis.conf  && \
		sed -i 's/# cluster-node-timeout.*$/cluster-node-timeout 5000/g' /home/redis_cluster/7000/conf/redis.conf  && \
		sed -i 's/appendonly no/appendonly yes/g' /home/redis_cluster/7000/conf/redis.conf 
		
RUN sed -i 's/port.*$/port 7001/g' /home/redis_cluster/7001/conf/redis.conf && \
		sed -i 's/logfile.*$/logfile "\/home\/redis_cluster\/7001\/logs\/redis.log"/g' /home/redis_cluster/7001/conf/redis.conf && \
		sed -i 's/# cluster-enabled yes/cluster-enabled yes/g' /home/redis_cluster/7001/conf/redis.conf  && \
		sed -i 's/# cluster-config-file.*$/cluster-config-file /home/redis_cluster/7001/conf/nodes_7001.conf/g' /home/redis_cluster/7001/conf/redis.conf  && \
		sed -i 's/# cluster-node-timeout.*$/cluster-node-timeout 5000/g' /home/redis_cluster/7001/conf/redis.conf  && \
		sed -i 's/appendonly no/appendonly yes/g' /home/redis_cluster/7001/conf/redis.conf
		
RUN sed -i 's/port.*$/port 7002/g' /home/redis_cluster/7002/conf/redis.conf && \
		sed -i 's/logfile.*$/logfile "\/home\/redis_cluster\/7002\/logs\/redis.log"/g' /home/redis_cluster/7002/conf/redis.conf && \
		sed -i 's/# cluster-enabled yes/cluster-enabled yes/g' /home/redis_cluster/7002/conf/redis.conf  && \
		sed -i 's/# cluster-config-file.*$/cluster-config-file /home/redis_cluster/7002/conf/nodes_7002.conf/g' /home/redis_cluster/7002/conf/redis.conf  && \
		sed -i 's/# cluster-node-timeout.*$/cluster-node-timeout 5000/g' /home/redis_cluster/7002/conf/redis.conf  && \
		sed -i 's/appendonly no/appendonly yes/g' /home/redis_cluster/7002/conf/redis.conf 

RUN sed -i 's/port.*$/port 7003/g' /home/redis_cluster/7003/conf/redis.conf && \
		sed -i 's/logfile.*$/logfile "\/home\/redis_cluster\/7003\/logs\/redis.log"/g' /home/redis_cluster/7003/conf/redis.conf && \
		sed -i 's/# cluster-enabled yes/cluster-enabled yes/g' /home/redis_cluster/7003/conf/redis.conf  && \
		sed -i 's/# cluster-config-file.*$/cluster-config-file /home/redis_cluster/7003/conf/nodes_7003.conf/g' /home/redis_cluster/7003/conf/redis.conf  && \
		sed -i 's/# cluster-node-timeout.*$/cluster-node-timeout 5000/g' /home/redis_cluster/7003/conf/redis.conf  && \
		sed -i 's/appendonly no/appendonly yes/g' /home/redis_cluster/7003/conf/redis.conf 
		
RUN sed -i 's/port.*$/port 7004/g' /home/redis_cluster/7004/conf/redis.conf && \
		sed -i 's/logfile.*$/logfile "\/home\/redis_cluster\/7004\/logs\/redis.log"/g' /home/redis_cluster/7004/conf/redis.conf && \
		sed -i 's/# cluster-enabled yes/cluster-enabled yes/g' /home/redis_cluster/7004/conf/redis.conf  && \
		sed -i 's/# cluster-config-file.*$/cluster-config-file /home/redis_cluster/7004/conf/nodes_7004.conf/g' /home/redis_cluster/7004/conf/redis.conf  && \
		sed -i 's/# cluster-node-timeout.*$/cluster-node-timeout 5000/g' /home/redis_cluster/7004/conf/redis.conf  && \
		sed -i 's/appendonly no/appendonly yes/g' /home/redis_cluster/7004/conf/redis.conf 
		
RUN sed -i 's/port.*$/port 7005/g' /home/redis_cluster/7005/conf/redis.conf && \
		sed -i 's/logfile.*$/logfile "\/home\/redis_cluster\/7005\/logs\/redis.log"/g' /home/redis_cluster/7005/conf/redis.conf && \
		sed -i 's/# cluster-enabled yes/cluster-enabled yes/g' /home/redis_cluster/7005/conf/redis.conf  && \
		sed -i 's/# cluster-config-file.*$/cluster-config-file /home/redis_cluster/7005/conf/nodes_7005.conf/g' /home/redis_cluster/7005/conf/redis.conf  && \
		sed -i 's/# cluster-node-timeout.*$/cluster-node-timeout 5000/g' /home/redis_cluster/7005/conf/redis.conf  && \
		sed -i 's/appendonly no/appendonly yes/g' /home/redis_cluster/7005/conf/redis.conf  		


##�ⲿ�����ļ��ͽű����Ƶ�container��

#ɾ��container�е�redis.conf��ʹ���ⲿ�Զ����redis.conf. ADD�����dockerfile·���µ�confĿ¼�е��ļ����Ƶ������ĵ�ǰĿ¼(/home/redis/redis-3.0.6)
ADD conf .
#��startup�ű����Ƶ�/home/redis_cluster/Ŀ¼��
ADD bin /home/redis_cluster
RUN chmod +x /home/redis_cluster/startup.sh
#��startup.sh��window�༭�µĸ�ʽת����linux��ʽ
RUN dos2unix /home/redis_cluster/startup.sh
##��¶7000 7001 7002 7003 7004 7005�˿�
EXPOSE 7000 7001 7002 7003 7004 7005

##����������ִ������redis-server redis.conf
ENTRYPOINT sh /home/redis_cluster/startup.sh