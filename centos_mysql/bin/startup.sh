#/!bin/bash
## 初始化mysql
#在MySQL5.7.9中有一些新的特性如：
#1、初始化数据库时不再使用"--mysql_install_db"而是使用了"--initialize"或是"--initialize-insecure〃，
#		区别在于"--initialize"会生成一个随机密码而"--initialize-insecure"不会生成密码。
#2、不在生成.mysql_secret文件；
#3、不再创建匿名用户MySQL账户；
#4、不再创建测试数据库
mysqld --initialize-insecure --user=mysql --basedir=/usr/local/mysql --datadir=/usr/local/mysql/data
#mysql配置文件my.cnf
cp /usr/local/mysql/support-files/my-default.cnf /etc/my.cnf
#第一次启动mysql
mysqld_safe --user=mysql &
#休眠2s，等待mysql启动成功
sleep 2
#修改mysql密码
mysqladmin -uroot  password 'root'
#修改root用户权限，放开给所有ip mysql.user表中添加了一条root@%的用户记录。-e 执行语句（执行语句之后，客户端并不停止在mysql的登陆界面中，而是停留在shell的主线程中）
mysql -uroot -proot -e "grant all privileges on *.* to root@'%' identified by 'root'; flush privileges;"
#关闭mysql
mysqladmin -uroot -proot shutdown

## 后台启动mysql
#直接运行mysqld程序来启动MySQL服务的方法很少见，mysqld_safe脚本会在启动MySQL服务器后继续监控其运行情况，并在其死机时重新启动它。用mysqld_safe脚本来启动MySQL服务器的做法在BSD风格的unix系统上很常见，非BSD风格的UNIX系统中的 mysql.server脚本其实也是调用mysqld_safe脚本去启动MySQL服务器的。它通常做如下事情：
#1. 检查系统和选项。
#2. 检查MyISAM表。
#3. 保持MySQL服务器窗口。
#4. 启动并监视mysqld，如果因错误终止则重启。
#5. 将mysqld的错误消息发送到数据目录中的host_name.err 文件。
#6. 将mysqld_safe的屏幕输出发送到数据目录中的host_name.safe文件
mysqld_safe --user=mysql

##启动方式
#    一、启动
#　　1、使用 service 启动：service mysqld start
#　　2、使用 mysqld 脚本启动：/etc/inint.d/mysqld start
#　　3、使用 safe_mysqld 启动：safe_mysqld&
#　　二、停止
#　　1、使用 service 启动：service mysqld stop
#　　2、使用 mysqld 脚本启动：/etc/inint.d/mysqld stop
#　　3、使用 mysqladmin启动： mysqladmin shutdown
#　　三、重启
#　　1、使用 service 启动：service mysqld restart
#　　2、使用 mysqld 脚本启动：/etc/inint.d/mysqld restart

