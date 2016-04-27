## Vagrant Puppet Master
Deploy a puppet master on CentOS 7.

### Automated Setup
bootstrap.sh sets the following:
* localtime
* Installs Puppet repo and Server
* Installs git
* Sets Puppet server memory allocation to 512MB
* Installs r10k and deploys environments
