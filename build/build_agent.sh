#!/bin/bash -e

mkdir -p /vagrant/dist

gpg2 --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3

curl -sSL https://get.rvm.io | bash -s stable

source /etc/profile.d/rvm.sh
rvm use --install 2.2.3
gem install --verbose bundler

rm -rf /var/cache/omnibus
cp -rf /vagrant /var/cache/omnibus
cd /var/cache/omnibus
bundle install --verbose --binstubs --jobs `nproc --ignore=1` --retry=3

if [ -f "/var/cache/omnibus/local.sh" ]; then
    source /var/cache/omnibus/local.sh
    echo "populating cache..."
    time bin/omnibus cache populate
fi

bin/omnibus build netuitive-agent

cp -f /var/cache/omnibus/pkg/* /vagrant/dist
cp -f /var/cache/omnibus/pkg/* /vagrant/testing/dist
