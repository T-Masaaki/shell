#!/bin/sh
echo "start process"
yum update -y
yum install -y gcc gcc-c++ openssl-devel readline-devel wget curl-devel expat-devel gettext-devel zlib-devel perl-ExtUtils-MakeMaker

echo "install latest git"
yum remove -y git
wget https://www.kernel.org/pub/software/scm/git/git-2.2.0.tar.gz
tar -zxf git-2.2.0.tar.gz
cd git-2.2.0
make prefix=/usr/local all
make prefix=/usr/local install
git --version
cd ..
rm -rf git-2.2.0*

echo "installing rbenv"
git clone git://github.com/sstephenson/rbenv.git ~/.rbenv
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bash_profile
echo 'eval "$(rbenv init -)"' >> ~/.bash_profile
rbenv -v

echo "install ruby 2.2.2"
rbenv install 2.2.2
rbenv global 2.2.2
ruby -v

echo "update gem"
gem update --system
gem -v

echo "install bundler"
gem install bundler
