##基础镜像centos
FROM centos


##创建者信息
MAINTAINER qiuwei "vesalqiu_000@163.com"


##安装程序

#安装wget
RUN yum -y install wget
#下载tomcat
RUN wget http://mirrors.hust.edu.cn/apache/tomcat/tomcat-8/v8.0.36/bin/apache-tomcat-8.0.36.tar.gz
# 下载jdk8 官网不能直接使用wget 必须添加必要的http头设置。
RUN wget --no-cookies --no-check-certificate --header "Cookie:gpw_e24=http%3a%2f%2fwww.oracle.com%2ftechnetwork%2fjava%2fjavase%2fdownloads%2fjdk7-downloads-1880260.html;oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u91-b14/jdk-8u91-linux-x64.tar.gz
#安装vim
RUN yum -y install vim*
#安装git
RUN yum -y install git*
#从github上下载
RUN git clone https://github.com/pein000/police_console.git 
#下载maven
RUN wget http://mirror.bit.edu.cn/apache/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz
# 下载gradle 2.9
RUN wget https://services.gradle.org/distributions/gradle-2.9-bin.zip
# 安装zip解压工具
RUN yum install -y unzip zip
#解压gradle
RUN unzip gradle-2.9-bin.zip
#gradle编译 打包
WORKDIR /home/tomcat/firstProject/share-online-video
RUN gradle clean war

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
