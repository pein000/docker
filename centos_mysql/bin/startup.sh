#/!bin/bash
## ��ʼ��mysql
#��MySQL5.7.9����һЩ�µ������磺
#1����ʼ�����ݿ�ʱ����ʹ��"--mysql_install_db"����ʹ����"--initialize"����"--initialize-insecure����
#		��������"--initialize"������һ����������"--initialize-insecure"�����������롣
#2����������.mysql_secret�ļ���
#3�����ٴ��������û�MySQL�˻���
#4�����ٴ����������ݿ�
mysqld --initialize-insecure --user=mysql --basedir=/usr/local/mysql --datadir=/usr/local/mysql/data
#mysql�����ļ�my.cnf
cp /usr/local/mysql/support-files/my-default.cnf /etc/my.cnf
#��һ������mysql
mysqld_safe --user=mysql &
#����2s���ȴ�mysql�����ɹ�
sleep 2
#�޸�mysql����
mysqladmin -uroot  password 'root'
#�޸�root�û�Ȩ�ޣ��ſ�������ip mysql.user���������һ��root@%���û���¼��-e ִ����䣨ִ�����֮�󣬿ͻ��˲���ֹͣ��mysql�ĵ�½�����У�����ͣ����shell�����߳��У�
mysql -uroot -proot -e "grant all privileges on *.* to root@'%' identified by 'root'; flush privileges;"
#�ر�mysql
mysqladmin -uroot -proot shutdown

## ��̨����mysql
#ֱ������mysqld����������MySQL����ķ������ټ���mysqld_safe�ű���������MySQL�����������������������������������ʱ��������������mysqld_safe�ű�������MySQL��������������BSD����unixϵͳ�Ϻܳ�������BSD����UNIXϵͳ�е� mysql.server�ű���ʵҲ�ǵ���mysqld_safe�ű�ȥ����MySQL�������ġ���ͨ�����������飺
#1. ���ϵͳ��ѡ�
#2. ���MyISAM��
#3. ����MySQL���������ڡ�
#4. ����������mysqld������������ֹ��������
#5. ��mysqld�Ĵ�����Ϣ���͵�����Ŀ¼�е�host_name.err �ļ���
#6. ��mysqld_safe����Ļ������͵�����Ŀ¼�е�host_name.safe�ļ�
mysqld_safe --user=mysql

##������ʽ
#    һ������
#����1��ʹ�� service ������service mysqld start
#����2��ʹ�� mysqld �ű�������/etc/inint.d/mysqld start
#����3��ʹ�� safe_mysqld ������safe_mysqld&
#��������ֹͣ
#����1��ʹ�� service ������service mysqld stop
#����2��ʹ�� mysqld �ű�������/etc/inint.d/mysqld stop
#����3��ʹ�� mysqladmin������ mysqladmin shutdown
#������������
#����1��ʹ�� service ������service mysqld restart
#����2��ʹ�� mysqld �ű�������/etc/inint.d/mysqld restart

