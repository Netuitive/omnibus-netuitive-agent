#!/bin/bash -e

mkdir -p /vagrant/dist

gpg2 --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3

curl -sSL https://get.rvm.io | bash -s stable

source /etc/profile.d/rvm.sh

rvm use --install 1.9.3

gem install -v bundler

rm -rf /var/cache/omnibus
cp -rf /vagrant /var/cache/omnibus

cd /var/cache/omnibus
bundle install --binstubs
bin/omnibus build netuitive-agent

cp -f /var/cache/omnibus/pkg/* /vagrant/dist
