#!/bin/sh
echo 'Install Start!!'

#  Module_Install
yum install -y httpd
yum install -y mysql
yum install -y mlocate

#  Automatic_Start_Setting
chkconfig httpd on
chkconfig mysqld on

#  mlocate_update
updatedb

## Setting_For_Rails
#  yum_install
yum install -y git
yum install gcc-c++ glibc-headers openssl-devel readline libyaml-devel readline-devel zlib zlib-devel

#  ruby_install
git clone https://github.com/sstephenson/rbenv.git /usr/local/rbenv
echo 'export RBENV_ROOT="/usr/local/rbenv"' >> /etc/profile
echo 'export PATH="${RBENV_ROOT}/bin:${PATH}"' >> /etc/profile
echo 'eval "$(rbenv init -)"' >> /etc/profile
#  !!Action!! Terminal_Restart
rbenv --version
git clone https://github.com/sstephenson/ruby-build.git /usr/local/rbenv/plugins/ruby-build
rbenv install -l
rbenv install -v 2.1.2
rbenv rehash
rbenv global 2.1.2
ruby -v

gem install rails -v 5.0.0.1
