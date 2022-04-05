#!/bin/bash
wget -nv http://debrep.okb3.local/configs/proxied-repo.list -O /etc/apt/sources.list
apt update -y -qq
apt install -y realmd puppet
echo "Введите пароль от домена:"
read -s domainpwd
echo $domainpwd | realm join -v -U Администратор okb3.local
echo -e "[agent]\nserver = puppetserver1.okb3.local" > /etc/puppet/puppet.conf
puppet agent -t
