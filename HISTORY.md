Netuitive Linux Agent Release History
===============================
Version next
----------------------------

Version 0.7.6
----------------------------
- Make ConcurrentRotatingFileHandler default log handler in netuitive-agent.conf
- Add Docker Container Uptime feature to the NetuitiveDockerCollector

Version 0.7.5
----------------------------
- Exclude device mapper virtual drives from DiskSpaceCollector by default
- Add a default TCPCollector config
- Add ConsulCollector.conf to project config
- Add pkg concurrent-log-handler to fix locking, I/O errors when multiprocess logging to single file

Version 0.7.4
----------------------------
- Add default ConsulCollector.conf
- Add a Consul collector
- Retry failed checks using the updated Metricly Python client
- Adding DNSLookupCheckCollector.conf to project config
- Update cacerts.rb
- Change bzip2 source to fix broken build dependency

Version 0.7.3
----------------------------
- Add user-scripts creation to diamond.rb
- change default UserScripts directory to /opt/netuitive/user-scripts
- Fix ctx variable reference before assignment

Version 0.7.2
----------------------------
- Add missing quotes to ElasticSearchCollector default config option

Version 0.7.1
----------------------------
- Fix ElasticSearchCollector ssl config options type error

Version 0.7.0
----------------------------
- Add a SimpleCollector config (off by default)
- Add minimal mode (off by default) option to the NetuitiveDockerCollector
- Enable BaseCollector by default, per #80

Version 0.6.7
----------------------------
- Update pysnmp to 4.4.4

Version 0.6.6
----------------------------
- update python to 2.7.15

Version 0.6.5
----------------------------
- Add default configs for the metric fqn list file, closing #75
- Fix statsd poster to add a prefix only when the value is a non-empty string
- lock down license_scout version
- Increase timeout when bundle installing gems

Version 0.6.4
----------------------------
- Update the default API URL to Metricly
- Add HttpCollector.conf, closing #66
- Adding new DNS Lookup Check collector
- Adding PuppetDBCollector.conf, closing #71
- Add BaseCollector that collects CPU/MEM/NET/DISK metrics by delegation
- Add connection_timeout to NetuitiveHandler

Version 0.6.3
----------------------------
- Remove zip extension from get-support file output
- Add PowerDNSCollector.conf, closing #62
- Update netuitive-client-python to 0.3.1
  - Bug Fix and Performance Improvement on element metrics lookup during adding sample
- Update to the latest neuitive-diamond
  - Fix bug with PuppetDB collector
  - Fix bug with collector namespace

Version 0.6.2
----------------------------
- Fix netuitive-statsd poster which caches elements forever
- Fix remapping of the PuppetDB queue metrics for PuppetDB 5.1
- Add help content for port and process check collectors

Version 0.6.1
----------------------------
- Setting default Hearbeat Collector TTL to 150 seconds to reduce noise.
- Add PortCheckCollector and ProcessCheckCollector
- Increasing NetuitiveHandler batch size to 500.

Version 0.5.4
----------------------------
- Kafka Collector: better error handling per topic collection
- Adding percent diskspace available

Version 0.5.3 - May 15 2017
----------------------------
- update to the latest netuitive diamond
  - add simple mode support for NetuitiveDockerCollector
- enable simple mode by default for all collectors
- fix metrics blacklist for RabbitMQCollector
- fix metrics blacklist for ElasticSearchCollector

Version 0.5.2 - Feb 01 2017
----------------------------
- update to the latest netuitive diamond
  - account for new jmx structure for cassandra 3
  - corrected the name of the counter metrics
- new jolokia config
- new heardbeat collector
- fix typo in cassandra collector config
- fix error when removing agent from Ubuntu 16.04
- default kafka jolokia collector
- add metric whitelist for postgresql
- update rabbitmq blacklist
- update mongodb blacklist
- update cacerts to 2017.01.18
- update gmp to 6.1.2
- update mysql to 5.6.35
- update postgresql to 9.4.10
- update boto to 2.45.0
- update cython to 0.25.2
- update pymongo to 3.4.0
- update python to 2.7.13
- update setuptools to 33.1.1
- update zlib to 1.2.11
- update openssl to 1.0.2k

Version 0.5.1 - Nov 13 2016
----------------------------
- ignore cassandra table metrics by default
- update netuitive-python-client to the latest
  - fix millisecond timestamps
- update to the latest netuitive diamond
  - elasticsearch: support 5.x
  - mongodb: fix for dupe datapoints and add better SSL suport
  - memcached: call socket.recv multiple times to get all stats
  - netuitivedocker: support container metrics for new and old APIs
  - cassandra_jolokia: fix cassandra error handling
  - netuitive_handler: add azure meta data
- update to the latest netuitive-statsd
  - fix "list index out of range" error for messages with bad formatting
- update cacerts to 2016.11.02
- update mysql to 5.6.34
- update netuitive-event-handler
- upgrade openssl to 1.0.2j
- update pip to 9.0.1
- update boto to 2.43.0
- update cython to 0.25.1
- update docker-py to 1.10.6
- update psutil to 4.4.2
- update pymongo to 3.3.1
- update setuptools to 28.8.0
- update xproto to 7.0.31
- fix build issue with too old wget on debian 7

Version 0.5.0 - Sep 30 2016
----------------------------
- update to the latest netuitive diamond
  - change metric names in a Cassandra
  - improve userscripts collector error messages
  - adding more rollover functionality to archive handler
  - valuable stats are missed due to missing types
  - allow precision to be set in nginx collector
  - add collector for Linux kernel bcache statistics
  - fix leading dot when prefix empty
- fix typo in default PostgresqlCollector.conf
- improve logging
- update cacerts to 2016.09.14
- update libedit to 20160903-3.1
- update mysql to 5.6.33
- upgrade openssl to 1.0.2i
- update docker-py to 1.10.3
- update psutil to 4.3.1
- update setuptools to 27.3.0

Version 0.4.1 - Sep 01 2016
----------------------------
- update to the latest netuitive diamond
- build updates
- fix typo in get-support script
- add more example config files
- update mysql to 5.6.32
- update postgresql to 9.4.9
- update docker-py to 1.9.0
- update supervisor to 3.3.1
- update setuptools to 26.1.1

Version 0.4.0 - Jul 25 2016
----------------------------
- update netuitive-client-python to 0.2.0
  - sanitize metric names
- update to the latest netuitive diamond
  - Fix/correct counter publishing
- update netuitive-statsd to 0.2.0
- update boto to 2.42.0
- update cython to 0.24.1
- update psycopg2 to 2.6.2
- update pymongo to 3.3.0
- update setuptools to 25.0.1
- change git repo for Netuitive Diamond
- address reinstall issue on deb based installs
- add get-support script
- add alpha version of netuitive-event-handler

Version 0.3.2 - Jul 11 2016
----------------------------
- update Netuitive Diamond
- update netuitive-statsd to 0.1.1
    - fix tag processing bug

Version 0.3.1 - Jun 30 2016
----------------------------
- update Netuitive Diamond
    - add Kafka Consumer Lag Collector
    - add reserved tag for enabled collectors
- update python to 2.7.12
- upgrade openssl to 1.0.2h
- update gmp to 6.1.1
- update libedit to 20160618-3.1
- update boto to 2.41.0
- update psutil to 4.3.0
- update setuptools to 23.1.0

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
