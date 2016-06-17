Netuitive Linux Agent Release History
===============================

Version 0.3.0 - Jun 17 2016
----------------------------
- update netuitive-statsd to 0.1.0
    - Change the way SUM is calculated for counter types. SUM will now be calculated as sum the input values instead of the sum of incremental updated counter value for each time period.
- update setuptools to 23.0.0

Version 0.2.10 - Jun 08 2016
----------------------------
- update Diamond from our upstream repo
- update netuitive-statsd to 0.0.8
- update mysql to 5.6.31
- update setuptools to 22.0.5

Version 0.2.9 - May 20 2016
---------------------------
- update cacerts to 2016.04.20
- update mysql to 5.6.30
- update pip to 8.1.2
- update pkg-config to 0.29.1
- update postgresql to 9.4.8
- update boto to 2.40.0
- update docker-py to 1.8.1
- update psutil to 4.2.0
- update setproctititle to 1.1.10
- update supervisor to 3.3.0
- update setuptools to 21.1.0
- update xproto to 7.0.29
- update netuitive-python-client to the latest

Version 0.2.8 - May 11 2016
---------------------------
- update netuitive-statsd to 0.0.6

Version 0.2.7 - May 03 2016
---------------------------
- update Diamond from our upstream repo
- add more example collector conf files
- update openssl to 1.0.1t

Version 0.2.6 - Apr 14 2016
---------------------------
- update Diamond from our upstream repo
- change handler to netuitive_handler instead of netuitive_cloud
- move to a docker for build/testing solution
- move our customizations to our diamond fork
- add upgrade script
- move MySQL and Httpd collector example configs to /opt/netuitive-agent/conf/collectors
- update netuitive-python-client to the latest
- update postgresql to 9.4.7
- update cython to 0.24
- update docker-py to 1.8.0
- update psutil to 4.1.0
- update pymongo to 3.2.2
- update supervisor to 3.2.3
- update setuptools to 20.6.7


Version 0.2.5 - Mar 21 2016
---------------------------
- add mysql and httpd collector default configs
- don't post if we don't have enough metrics
- fix for agent restarts on some Ubuntu systems
- fix python path in netuitive-agent script
- update pip to 8.1.1
- update netuitive-python-client to the latest

Version 0.2.4 - Mar 8 2016
--------------------------
- add time offset check
- move temp directory for install
- update Diamond with upstream
- update netuitive-python-client to 0.1.1
- build deb packages on debian 7 (libc fix)

Version 0.2.3 - Mar 1 2016
--------------------------
- update openssl to 1.0.1s
- update mysql to 5.6.29
- update postgresql to 9.4.6
- update pip to 8.0.3
- update docker-py to 1.7.2
- update pymongo to 3.2.1
- update mysnmp to 4.3.2
- upgrade setuptools to 20.2.2
- update dependency links to xorg.freedesktop.org
- update Diamond with upstream
- add "heartbeat" log message
- add netuitive-statsd
- switch to using master branch on Netuitive/Diamond

Version 0.2.2 - Jan 29 2016
---------------------------
- update python to 2.7.11
- update mysql to 5.6.28
- update openssl to 1.0.1r
- update pymongo to 3.2
- update setuptool to 19.2
- update pip to 8.0.2
- update cacerts to 2016.01.20
- update boto to 2.39.0
- update psutil to 3.4.2
- update setuptools to 19.6.1
- update Diamond with upstream
- add SNMP support
- add location support

Version 0.2.1 - Dec 3 2015
--------------------------
- update Diamond with upstream
- update docker-py to 1.6.0
- update psutil to 3.3.0
- update setuptools to 18.7
- replace python-statsd module with statsd
- add new metric_queue_size setting
- add relation support
- change log file name to netuitive-agent.log

Version 0.2.0 - Unreleased
--------------------------

Version 0.1.9 - Nov 24 2015
---------------------------
- update netuitive cloud handler for more precise human readable values
- update Diamond with upstream
- update pymongo to 3.1.1

Version 0.1.8 - Nov 6 2015
--------------------------
- update docker-py to 1.5.0
- update cacerts to 2015.10.28
- update mysql-client to 5.6.27
- update postgresql to 9.4.5
- update cython to 0.23.4
- update netuitive to 0.0.8
- update psutil to 3.2.2
- update pymongo to 3.1
- update redis to 2.10.5
- update setuptools to 18.5
- remove fix for network and memory collectors (fixed upstream)

Version 0.1.7 - Sep 25 2015
--------------------------
- support latest omnibus
- update Diamond with upstream
- move to bento boxes for Vagrant
- add cython dependency for pyutmp
- reduce systemd logging
- docker collector should send memory items as gauge
- update cacerts to 2015.09.02
- update pip to 7.1.2
- update docker-py to 1.4.0
- update psutil to 3.2.1
- update setuptools to 18.3.1

Version 0.1.6 - Aug 4 2015
--------------------------
- reduce log level for docker attributes gathering errors
- update setuptools to 18.1
- update setproctititle to 1.1.9
- update psutil to 3.1.1
- update docker-py to 1.3.1
- update mysql-client to 5.6.26
- fix for network and memory collectors because psutil functions were renamed in later versions

Version 0.1.5 - Jul 16 2015
---------------------------
- add docker collector

Version 0.1.4 - Jul 9 2015
---------------------------
- upgrade openssl to 1.0.1p
- update netuitive python module to 0.0.7

Version 0.1.2 - Jun 12 2015
---------------------------
- upgrade openssl to 1.0.1n
- update netuitive python module to 0.0.5
- add support for debian 7 (wheezy)

Version 0.1.0 - Jun 4 2015
--------------------------
- First beta release

