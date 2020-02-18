#!/bin/bash -e



# gpg2 --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3

# curl -sSL https://get.rvm.io | bash -s stable

# source /etc/profile.d/rvm.sh
# rvm use --install 2.5.1
# gem install --verbose bundler

if [ -f "/usr/bin/yum" ]; then
    yum -y update
else
    apt-get update
    apt-get upgrade -y
fi

mkdir -pv /vagrant/dist
rm -rfv /var/cache/omnibus
cp -rfv /vagrant /var/cache/omnibus
cd /var/cache/omnibus

source /etc/profile.d/rvm.sh
rvm use --install 2.5.1
bundle config timeout 30
bundle install --verbose --binstubs --jobs `nproc --ignore=1` --retry=3

if [ -f "/var/cache/omnibus/local.sh" ]; then
    source /var/cache/omnibus/local.sh
    echo "populating cache..."
    bin/omnibus cache populate
fi

bin/omnibus build netuitive-agent --log-level=debug

cp -fv /var/cache/omnibus/pkg/* /vagrant/dist
cp -fv /var/cache/omnibus/pkg/* /vagrant/testing/dist
