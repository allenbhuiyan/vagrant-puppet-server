#!/usr/bin/env bash
# Set localtime to Phoenix
rm /etc/localtime
ln -s /usr/share/zoneinfo/America/Phoenix /etc/localtime
# Install Puppet repo
rpm -Uvh https://yum.puppetlabs.com/puppetlabs-release-pc1-el-7.noarch.rpm
# Install Puppet Server anf git
yum install -y puppetserver git
# Set Puppet Server memory allocation to 512MB for smaller VMs
sed -i -- 's/JAVA_ARGS="-Xms2g -Xmx2g -XX:MaxPermSize=256m"/JAVA_ARGS="-Xms512m -Xmx512m -XX:MaxPermSize=256m"/g' /etc/sysconfig/puppetserver
# Enable and start Puppet Server
systemctl enable puppetserver
systemctl start puppetserver
# Install r10k, copy config, and deploy enviornments
/opt/puppetlabs/puppet/bin/gem install r10k
cp -r /home/vagrant/sync/master/r10k /etc/puppetlabs
/opt/puppetlabs/puppet/bin/r10k deploy environment
