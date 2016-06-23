##创建redis集群，本集群是基于端口号的redis cluster。

##基础镜像centos
FROM centos


##创建者信息
MAINTAINER qiuwei "vesalqiu_000@163.com"


##安装程序

#安装wget
RUN yum -y install wget
#安装make
RUN yum -y install gcc automake autoconf libtool make
#安装vim
RUN yum -y install vim*
#安装ruby
RUN yum -y install ruby
RUN yum -y install rubygems
#安装网络工具
RUN yum -y install net-tools
#缺少redis和ruby的接口，使用gem 安装
RUN gem install redis
#安装dos2unix 用户startup.sh使用window写入，在linux执行时出现无法执行的问题。
RUN yum -y install dos2unix
#新建用户
RUN useradd redis
#切换到redis用户目录
WORKDIR /home/redis_cluster
#下载reids 3.0
RUN wget http://download.redis.io/releases/redis-3.0.6.tar.gz
#解压
RUN tar -zxvf redis-3.0.6.tar.gz
#切换到redis目录
WORKDIR redis-3.0.6
#源码安装redis，成功后，在src目录中存在redis-cli、redis-server。
RUN make
#创建目录
RUN mkdir -p /home/redis_cluster/7000/bin /home/redis_cluster/7001/bin /home/redis_cluster/7002/bin /home/redis_cluster/7003/bin /home/redis_cluster/7004/bin /home/redis_cluster/7005/bin
RUN mkdir -p /home/redis_cluster/7000/conf /home/redis_cluster/7001/conf /home/redis_cluster/7002/conf /home/redis_cluster/7003/conf /home/redis_cluster/7004/conf /home/redis_cluster/7005/conf
RUN mkdir -p /home/redis_cluster/7000/logs /home/redis_cluster/7001/logs /home/redis_cluster/7002/logs /home/redis_cluster/7003/logs /home/redis_cluster/7004/logs /home/redis_cluster/7005/logs
#将redis-trib.rb放置到redis_cluster目录下
RUN cp /home/redis/redis-3.0.6/src/redis-trib.rb /home/redis_cluster/
#编译成功的redis程序，放置到各个目录下
RUN cp -R /home/redis/redis-3.0.6/src/redis-cli /home/redis/redis-3.0.6/src/redis-server /home/redis/redis-3.0.6/src/redis-benchmark  /home/redis/redis-3.0.6/src/redis-sentinel /home/redis_cluster/7000/bin/
RUN cp -R /home/redis/redis-3.0.6/src/redis-cli /home/redis/redis-3.0.6/src/redis-server /home/redis/redis-3.0.6/src/redis-benchmark  /home/redis/redis-3.0.6/src/redis-sentinel /home/redis_cluster/7001/bin/
RUN cp -R /home/redis/redis-3.0.6/src/redis-cli /home/redis/redis-3.0.6/src/redis-server /home/redis/redis-3.0.6/src/redis-benchmark  /home/redis/redis-3.0.6/src/redis-sentinel /home/redis_cluster/7002/bin/
RUN cp -R /home/redis/redis-3.0.6/src/redis-cli /home/redis/redis-3.0.6/src/redis-server /home/redis/redis-3.0.6/src/redis-benchmark  /home/redis/redis-3.0.6/src/redis-sentinel /home/redis_cluster/7003/bin/
RUN cp -R /home/redis/redis-3.0.6/src/redis-cli /home/redis/redis-3.0.6/src/redis-server /home/redis/redis-3.0.6/src/redis-benchmark  /home/redis/redis-3.0.6/src/redis-sentinel /home/redis_cluster/7004/bin/
RUN cp -R /home/redis/redis-3.0.6/src/redis-cli /home/redis/redis-3.0.6/src/redis-server /home/redis/redis-3.0.6/src/redis-benchmark  /home/redis/redis-3.0.6/src/redis-sentinel /home/redis_cluster/7005/bin/
#将配置文件redis.conf，放置到各个目录下
RUN cp /home/redis/redis-3.0.6/redis.conf /home/redis_cluster/7000/conf/
RUN cp /home/redis/redis-3.0.6/redis.conf /home/redis_cluster/7001/conf/
RUN cp /home/redis/redis-3.0.6/redis.conf /home/redis_cluster/7002/conf/
RUN cp /home/redis/redis-3.0.6/redis.conf /home/redis_cluster/7003/conf/
RUN cp /home/redis/redis-3.0.6/redis.conf /home/redis_cluster/7004/conf/
RUN cp /home/redis/redis-3.0.6/redis.conf /home/redis_cluster/7005/conf/
#修改各个配置文件的内容。将redis.conf中配置集群参数
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


##外部配置文件和脚本复制到container中

#删除container中的redis.conf。使用外部自定义的redis.conf. ADD命令：将dockerfile路径下的conf目录中的文件复制到容器的当前目录(/home/redis/redis-3.0.6)
ADD conf .
#将startup脚本复制到/home/redis_cluster/目录下
ADD bin /home/redis_cluster
RUN chmod +x /home/redis_cluster/startup.sh
#将startup.sh的window编辑下的格式转换成linux格式
RUN dos2unix /home/redis_cluster/startup.sh
##暴露7000 7001 7002 7003 7004 7005端口
EXPOSE 7000 7001 7002 7003 7004 7005

##启动容器，执行命令redis-server redis.conf
ENTRYPOINT sh /home/redis_cluster/startup.sh
