#!/bin/sh
echo 'Install Start!!'

#  Module_Install
sudo yum install -y httpd
sudo yum install -y mysql
sudo yum install -y mysql-client mysql-server
sudo yum install -y mlocate
sudo yum install -y wget
sudo yum install -y git
sudo yum install -y gcc openssl-devel libyaml-devel libffi-devel readline-devel zlib-devel gdbm-devel ncurses-devel

#  Automatic_Start_Setting
sudo chkconfig httpd on
sudo chkconfig mysqld on

#  mlocate_update
sudo updatedb

## Setting_For_Rails
#  yum_install
yum install gcc-c++ glibc-headers openssl-devel readline libyaml-devel readline-devel zlib zlib-devel

#  ruby_install
git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
echo 'eval "$(rbenv init -)"' >> ~/.bash_profile

git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build

#sudo git clone https://github.com/sstephenson/rbenv.git /usr/local/rbenv
#echo 'export RBENV_ROOT="/usr/local/rbenv"' >> /etc/profile
#echo 'export PATH="${RBENV_ROOT}/bin:${PATH}"' >> /etc/profile
#echo 'eval "$(rbenv init -)"' >> /etc/profile
#  !!Action!! Terminal_Restart
#rbenv --version
#git clone https://github.com/sstephenson/ruby-build.git /usr/local/rbenv/plugins/ruby-build
rbenv install -l
rbenv install -v 2.1.2
rbenv rehash
rbenv global 2.1.2
ruby -v

gem install rails -v 5.0.0.1
