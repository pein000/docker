#!/bin/bash
##当检测到nginx进程不存在的时候，就干掉所有的keepalived，这时候，请求将会由keepalived的backup接管！！
if [ "$(ps -ef | grep "nginx: master process"| grep -v grep )" == "" ]
 then
 killall keepalived
fi