# base image
FROM centos

# creator description
MAINTAINER qiuwei "vesalqiu_000@163.com"

## install software
#下载wget
RUN yum -y install wget
#添加用户组和用户
RUN groupadd mysql
RUN useradd -r -g mysql mysql #-r:表示系统用户，不可使用此用户登录 -g：所属组
#创建/home/mysql目录并切换
RUN mkdir /home/mysql
WORKDIR /home/mysql
#下载mysql
RUN wget http://dev.mysql.com/get/Downloads/MySQL-5.7/mysql-5.7.13-linux-glibc2.5-x86_64.tar.gz
#解压
RUN tar -zxvf mysql-5.7.13-linux-glibc2.5-x86_64.tar.gz
## create soft link to mysql
#创建mysql软连接，因mysql目录太长
RUN ln -s /home/mysql/mysql-5.7.13-linux-glibc2.5-x86_64 /usr/local/mysql 
#创建data目录，存放日志文件和系统表文件
RUN mkdir /usr/local/mysql/data
#修改mysql目录下的属组为 组：mysql 用户：mysql
RUN chown -R mysql:mysql /home/mysql/mysql-5.7.13-linux-glibc2.5-x86_64
# 安装依赖包
RUN yum -y install libaio*
## 添加环境配置 mysql环境配置
ENV PATH=/usr/local/mysql/bin:$PATH
#将startup脚本复制到/home/mysql/目录下
ADD bin /home/mysql
#添加执行权限
RUN chmod +x /home/mysql/startup.sh
#安装dos2unix 用户startup.sh使用window写入，在linux执行时出现无法执行的问题。
RUN yum -y install dos2unix
#将startup.sh的window编辑下的格式转换成linux格式
RUN dos2unix /home/mysql/startup.sh

##暴露3306端口
EXPOSE 3306

##容器启动执行脚本
ENTRYPOINT sh /home/mysql/startup.sh


