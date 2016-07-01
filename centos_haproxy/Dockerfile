##基础镜像centos
FROM centos


##创建者信息
MAINTAINER qiuwei "vesalqiu_000@163.com"


##安装程序

#添加haproxy用户组
RUN useradd haproxy
WORKDIR /home/haproxy
#安装wget
RUN yum -y install wget
#下载tomcat
RUN wget https://github.com/haproxy/haproxy/archive/master.zip
#zip解压工具
RUN yum install -y unzip zip；
#解压
RUN unzip master.zip
#安装gcc make
RUN yum -y install gcc* make
#进入haproxy-master目录中
WORKDIR haproxy-master
#源码安装，但没有configure文件，目标linux 2.6内核，安装路径/usr/local/haproxy
#编译
RUN make TARGET=linux26 PREFIX=/usr/local/haproxy 
#安装
RUN make install PREFIX=/usr/local/haproxy 
#将配置文件复制到容器镜像中
ADD conf /usr/local/haproxy

#暴露端口
EXPOSE 8888

#容器启动
ENTRYPOINT /usr/local/haproxy/sbin/haproxy -f /usr/local/haproxy/haproxy.cfg
