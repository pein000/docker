##��������centos
FROM centos


##��������Ϣ
MAINTAINER qiuwei "vesalqiu_000@163.com"


##��װ����

#��װwget
RUN yum -y install wget
#����tomcat
RUN wget http://mirrors.hust.edu.cn/apache/tomcat/tomcat-8/v8.0.36/bin/apache-tomcat-8.0.36.tar.gz
# ����jdk8 ��������ֱ��ʹ��wget �������ӱ�Ҫ��httpͷ���á�
wget --no-cookies --no-check-certificate --header "Cookie:gpw_e24=http%3a%2f%2fwww.oracle.com%2ftechnetwork%2fjava%2fjavase%2fdownloads%2fjdk7-downloads-1880260.html;oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u91-b14/jdk-8u91-linux-x64.tar.gz
#��װvim
RUN yum -y install vim*
#��װgit
RUN yum -y install git*
#��github������
RUN git clone https://github.com/pein000/police_console.git 
#����maven
RUN wget http://mirror.bit.edu.cn/apache/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz
# ����gradle 2.9
RUN wget https://services.gradle.org/distributions/gradle-2.9-bin.zip
# ��װzip��ѹ����
RUN yum install -y unzip zip
#��ѹgradle
RUN unzip gradle-2.9-bin.zip
#gradle���� ���
WORKDIR /home/tomcat/firstProject/share-online-video
RUN gradle clean war

RUN yum -y install gcc automake autoconf libtool make
#��װvim
RUN yum -y install vim*
#�½��û�
RUN useradd redis
#�л���redis�û�Ŀ¼
WORKDIR /home/redis
#����reids 3.0
RUN wget http://download.redis.io/releases/redis-3.0.6.tar.gz
#��ѹ
RUN tar -zxvf redis-3.0.6.tar.gz
#�л���redisĿ¼
WORKDIR redis-3.0.6
#Դ�밲װredis���ɹ�����srcĿ¼�д���redis-cli��redis-server��
RUN make
#ɾ��container�е�redis.conf��ʹ���ⲿ�Զ����redis.conf. ADD�����dockerfile·���µ�confĿ¼�е��ļ����Ƶ������ĵ�ǰĿ¼(/home/redis/redis-3.0.6)
ADD conf .
#�½�logsĿ¼�������־
RUN mkdir logs

##��¶6380�˿�
EXPOSE 6380


##����������ִ������redis-server redis.conf
ENTRYPOINT ./src/redis-server redis.conf