#!/bin/bash -e

export PATH=/usr/local/sbin:/usr/local/sbin:/usr/local/bin:/sbin:/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin:/opt/aws/bin:/root/bin

rm -f /vagrant/`hostname`.log
rm -f /vagrant/`hostname`.pass


if [ `hostname` == "centos6" ]; then

    yum install -y initscripts
    nohup python /vagrant/testserver.py  > /vagrant/`hostname`-testserver.log 2>&1 &
    for f in /vagrant/dist/*.rpm; do rpm -ivh $f; done
    cat /vagrant/test.conf > /opt/netuitive-agent/conf/netuitive-agent.conf
    service netuitive-agent start

elif [ `hostname` == "centos7" ]; then
    yum install -y initscripts
    nohup python /vagrant/testserver.py  > /vagrant/`hostname`-testserver.log 2>&1 &
    for f in /vagrant/dist/*.rpm; do rpm -ivh $f; done
    cat /vagrant/test.conf > /opt/netuitive-agent/conf/netuitive-agent.conf
    # /opt/netuitive-agent/bin/supervisord -c /opt/netuitive-agent/conf/supervisor.conf
    /bin/systemctl start netuitive-agent

elif [ `hostname` == "debian7" ]; then
    apt-get update
    apt-get -y install sysv-rc-conf lsb-release python; sync; sync
    rm -f /sbin/initctl
    nohup python /vagrant/testserver.py  > /vagrant/`hostname`-testserver.log 2>&1 &
    for f in /vagrant/dist/*.deb; do dpkg -i $f; done
    cat /vagrant/test.conf > /opt/netuitive-agent/conf/netuitive-agent.conf
    service netuitive-agent start

elif [ `hostname` == "debian8" ]; then
    apt-get update
    apt-get -y install python
    nohup python /vagrant/testserver.py  > /vagrant/`hostname`-testserver.log 2>&1 &
    for f in /vagrant/dist/*.deb; do dpkg -i $f; done
    cat /vagrant/test.conf > /opt/netuitive-agent/conf/netuitive-agent.conf
    /bin/systemctl start netuitive-agent

elif [ `hostname` == "ubuntu12" ]; then
    apt-get update
    apt-get -y install python
    nohup python /vagrant/testserver.py  > /vagrant/`hostname`-testserver.log 2>&1 &
    for f in /vagrant/dist/*.deb; do dpkg -i $f; done
    cat /vagrant/test.conf > /opt/netuitive-agent/conf/netuitive-agent.conf
    /sbin/initctl start netuitive-agent

elif [ `hostname` == "ubuntu14" ]; then
    apt-get update
    apt-get -y install python
    nohup python /vagrant/testserver.py  > /vagrant/`hostname`-testserver.log 2>&1 &
    for f in /vagrant/dist/*.deb; do dpkg -i $f; done
    cat /vagrant/test.conf > /opt/netuitive-agent/conf/netuitive-agent.conf
    # /opt/netuitive-agent/bin/supervisord -c /opt/netuitive-agent/conf/supervisor.conf
    /sbin/initctl start netuitive-agent

elif [ `hostname` == "ubuntu15" ]; then
    apt-get update
    apt-get -y install python
    nohup python /vagrant/testserver.py  > /vagrant/`hostname`-testserver.log 2>&1 &
    for f in /vagrant/dist/*.deb; do dpkg -i $f; done
    cat /vagrant/test.conf > /opt/netuitive-agent/conf/netuitive-agent.conf
    # /opt/netuitive-agent/bin/supervisord -c /opt/netuitive-agent/conf/supervisor.conf
    /bin/systemctl start netuitive-agent

elif [ `hostname` == "ubuntu16" ]; then
    apt-get update
    apt-get -y install python
    nohup python /vagrant/testserver.py  > /vagrant/`hostname`-testserver.log 2>&1 &
    for f in /vagrant/dist/*.deb; do dpkg -i $f; done
    cat /vagrant/test.conf > /opt/netuitive-agent/conf/netuitive-agent.conf
    # /opt/netuitive-agent/bin/supervisord -c /opt/netuitive-agent/conf/supervisor.conf
    /bin/systemctl start netuitive-agent

else
    echo "ERROR: `hostname` is unsupported distribution"
    exit 1
fi


sleep 300
