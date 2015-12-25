#!/bin/sh
echo "start process"
yum update -y
yum install -y git gcc gcc-c++ openssl-devel readline-devel

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
