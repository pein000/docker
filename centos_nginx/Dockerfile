# base image
FROM centos

# creator description
MAINTAINER qiuwei "vesalqiu_000@163.com"

## install software
#��װwget��������nginx
RUN yum -y install wget
#��װ gcc make ���ڱ���
RUN yum -y install gcc gcc-c++ autoconf automake 
#��װnginx��ģ������Ŀ�
RUN yum -y install zlib zlib-devel openssl openssl--devel pcre pcre-devel 
#����nginx�û�
RUN useradd nginx
#�л���nginxĿ¼��
WORKDIR /home/nginx
#����nginx 1.8.1�ȶ���
RUN wget http://nginx.org/download/nginx-1.8.1.tar.gz
#��ѹ
RUN tar -zxvf nginx-1.8.1.tar.gz
#�л���nginx-1.8.1
WORKDIR /home/nginx/nginx-1.8.1
#ִ��Դ��������
RUN ./configure
RUN make && make install
#�޸������ļ� �����ص�conf/nginx.conf�滻�����е�nginx.conf
ADD conf ./conf
ADD conf /usr/local/nginx/conf
##��¶80�˿�
EXPOSE 80

##����������ִ������nginx���� �رպ�ִ̨�У�������ǰ̨
ENTRYPOINT /usr/local/nginx/sbin/nginx -g 'daemon off;'




##nginx�������
#����
#nginx -s reload  ���޸����ú����¼�����Ч
#nginx -s reopen  �����´���־�ļ�
#nginx -t -c /path/to/nginx.conf ����nginx�����ļ��Ƿ���ȷ
#�ر�nginx��
#nginx -s stop  :����ֹͣnginx
#         quit  �����������ֹͣnginx

#������ֹͣnginx ��ʽ��
#ps -ef | grep nginx

#kill -QUIT �����̺�     ������ֹͣNginx
#kill -TERM �����̺�     ������ֹͣNginx
#pkill -9 nginx          ��ǿ��ֹͣNginx

#����nginx:
#nginx -c /path/to/nginx.conf #ָ�������ļ�