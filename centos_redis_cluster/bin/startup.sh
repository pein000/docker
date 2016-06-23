#!/bin/bash
echo 'begin to start redis-server'
/home/redis_cluster/7000/bin/redis-server /home/redis_cluster/7000/conf/redis.conf &
/home/redis_cluster/7001/bin/redis-server /home/redis_cluster/7001/conf/redis.conf &
/home/redis_cluster/7002/bin/redis-server /home/redis_cluster/7002/conf/redis.conf &
/home/redis_cluster/7003/bin/redis-server /home/redis_cluster/7003/conf/redis.conf &
/home/redis_cluster/7004/bin/redis-server /home/redis_cluster/7004/conf/redis.conf &
/home/redis_cluster/7005/bin/redis-server /home/redis_cluster/7005/conf/redis.conf &

##redis-trib.rb redis-servermasterslave
echo 'yes'| ruby /home/redis_cluster/redis-trib.rb create --replicas 1 127.0.0.1:7000 127.0.0.1:7001 127.0.0.1:7002 127.0.0.1:7003 127.0.0.1:7004 127.0.0.1:7005
##block
echo 'success to start up and to block allways! '
while true
do
                sleep 10m
done
