#!/usr/bin/env bash

rpm -Uvh https://yum.puppetlabs.com/puppetlabs-release-pc1-el-7.noarch.rpm
yum install -y puppetserver
sed -i -- 's/JAVA_ARGS="-Xms2g -Xmx2g -XX:MaxPermSize=256m"/JAVA_ARGS="-Xms512m -Xmx512m -XX:MaxPermSize=256m"/g' /etc/sysconfig/puppetserver
systemctl enable puppetserver
systemctl start puppetserver
/opt/puppetlabs/bin/puppet module install puppetlabs-ntp
