# base image
FROM centos

# creator description
MAINTAINER qiuwei "vesalqiu_000@163.com"

# install software
RUN yum -y install wget
RUN useradd mysql
RUN cd /home/mysql
RUN wget http://dev.mysql.com/get/Downloads/MySQL-5.7/mysql-5.7.13-linux-glibc2.5-x86_64.tar.gz
RUN tar -zxvf mysql-5.7.13-linux-glibc2.5-x86_64.tar.gz
RUN chown -R mysql:mysql /home/mysql/mysql-5.7.13-linux-glibc2.5-x86_64
## create soft link to mysql
RUN ln -s /usr/local/mysql /home/mysql/mysql-5.7.13-linux-glibc2.5-x86_64/
RUN mkdir /usr/local/mysql/data
## change own from root to mysql
RUN chown -R mysql:mysql /home/mysql/mysql-5.7.13-linux-glibc2.5-x86_64
## install depedencies
RUN yum -y install libalio*
## initial mysql 
RUN bin/mysqld -¡ªinitialize --user=mysql --basedir=/usr/local/mysql --datadir=/usr/local/mysql/data
## copy configure file
RUN cp /usr/local/mysql/support-files/my-default.cnf /etc/my.cnf
## add mysql path
ENV PATH=/usr/local/mysql/bin:$PATH
## link to mysql
RUN echo 'mysql -uroot

# execute start mysql by deamon
ENTRYPOINT ./usr/local/mysql/bin/mysqld_safe --user=mysql &

#
#USER mysql
