#!/bin/sh
sudo yum remove -y git
yum -y install wget curl-devel expat-devel gettext-devel openssl-devel zlib-devel perl-ExtUtils-MakeMaker
wget https://www.kernel.org/pub/software/scm/git/git-2.2.0.tar.gz
tar -zxf git-2.2.0.tar.gz
cd git-2.2.0
make prefix=/usr/local all
make prefix=/usr/local install
git --version
