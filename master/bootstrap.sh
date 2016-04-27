#!/usr/bin/env bash

rm /etc/localtime
ln -s /usr/share/zoneinfo/America/Phoenix /etc/localtime
rpm -Uvh https://yum.puppetlabs.com/puppetlabs-release-pc1-el-7.noarch.rpm
yum install -y puppetserver git
sed -i -- 's/JAVA_ARGS="-Xms2g -Xmx2g -XX:MaxPermSize=256m"/JAVA_ARGS="-Xms512m -Xmx512m -XX:MaxPermSize=256m"/g' /etc/sysconfig/puppetserver
systemctl enable puppetserver
systemctl start puppetserver
/opt/puppetlabs/puppet/bin/gem install r10k
cp -r /home/vagrant/sync/master/r10k /etc/puppetlabs
/opt/puppetlabs/puppet/bin/r10k deploy environment
