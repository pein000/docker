# base image
FROM mysql

# creator description
MAINTAINER qiuwei "vesalqiu_000@163.com"

# install software
#RUN mkdir /etc

ENV MYSQL_ROOT_PASSWORD=master
ADD ./master /etc

# execute start mysql by deamon
ENTRYPOINT mysql
