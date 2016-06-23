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
#新建用户
RUN useradd redis
#切换到redis用户目录
WORKDIR /home/redis
#下载reids 3.0
RUN wget http://download.redis.io/releases/redis-3.0.6.tar.gz
#解压
RUN tar -zxvf redis-3.0.6.tar.gz
#切换到redis目录
WORKDIR redis-3.0.6
#源码安装redis，成功后，在src目录中存在redis-cli、redis-server。
RUN make
#删除container中的redis.conf。使用外部自定义的redis.conf. ADD命令：将dockerfile路径下的conf目录中的文件复制到容器的当前目录(/home/redis/redis-3.0.6)
ADD conf .
#新建logs目录，存放日志
RUN mkdir logs

##暴露6380端口
EXPOSE 6380


##启动容器，执行命令redis-server redis.conf
ENTRYPOINT ./src/redis-server redis.conf
