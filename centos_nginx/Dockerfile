# base image
FROM centos

# creator description
MAINTAINER qiuwei "vesalqiu_000@163.com"

## install software
#安装wget用于下载nginx
RUN yum -y install wget
#安装 gcc make 用于编译
RUN yum -y install gcc gcc-c++ autoconf automake 
#安装nginx的模块所需的库
RUN yum -y install zlib zlib-devel openssl openssl--devel pcre pcre-devel 
#创建nginx用户
RUN useradd nginx
#切换到nginx目录下
WORKDIR /home/nginx
#下载nginx 1.8.1稳定版
RUN wget http://nginx.org/download/nginx-1.8.1.tar.gz
#解压
RUN tar -zxvf nginx-1.8.1.tar.gz
#切换到nginx-1.8.1
WORKDIR /home/nginx/nginx-1.8.1
#执行源码编译过程
RUN ./configure
RUN make && make install
#修改配置文件 将本地的conf/nginx.conf替换容器中的nginx.conf
ADD conf ./conf
ADD conf /usr/local/nginx/conf
##暴露80端口
EXPOSE 80

##容器启动，执行启动nginx命令 关闭后台执行，保持在前台
ENTRYPOINT /usr/local/nginx/sbin/nginx -g 'daemon off;'




##nginx启动命令：
#重启
#nginx -s reload  ：修改配置后重新加载生效
#nginx -s reopen  ：重新打开日志文件
#nginx -t -c /path/to/nginx.conf 测试nginx配置文件是否正确
#关闭nginx：
#nginx -s stop  :快速停止nginx
#         quit  ：完整有序的停止nginx

#其他的停止nginx 方式：
#ps -ef | grep nginx

#kill -QUIT 主进程号     ：从容停止Nginx
#kill -TERM 主进程号     ：快速停止Nginx
#pkill -9 nginx          ：强制停止Nginx

#启动nginx:
#nginx -c /path/to/nginx.conf #指定配置文件