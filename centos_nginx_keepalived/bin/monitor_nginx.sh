#!/bin/bash
##����⵽nginx���̲����ڵ�ʱ�򣬾͸ɵ����е�keepalived����ʱ�����󽫻���keepalived��backup�ӹܣ���
if [ "$(ps -ef | grep "nginx: master process"| grep -v grep )" == "" ]
 then
 killall keepalived
fi