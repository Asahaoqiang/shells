#!/bin/bash

jdk=jdk-8u60-linux-x64.tar.gz
jdkurl=http://www.testcn.top/hao_soft/mycat/${jdk}
tem_time=$(date +%Y%m%d)
mkdir /tmp_${tem_time}
which wget >/dev/null || yum install wget -y
wget -P /tmp_${tem_time} ${jdkurl}
tar -zxf /tmp_${tem_time}/${jdk} -C /tmp_${tem_time}
rm -rf /tmp_${tem_time}/${jdk}
jdkname=$(ls /tmp_${tem_time})
mv /tmp_${tem_time}/${jdkname} /usr/local/
#配置jdk环境变量
echo "#java env" >>/etc/profile
echo "export JAVA_HOME=/usr/local/${jdkname}" >>/etc/profile
echo "export CLASSPATH=.:\${JAVA_HOME}/jre/lib/rt.jar:\${JAVA_HOME}/lib/dt.jar:\${JAVA_HOME}/lib/tools.jar" >>/etc/profile
echo "export PATH=\$PATH:\${JAVA_HOME}/bin" >>/etc/profile
. /etc/profile