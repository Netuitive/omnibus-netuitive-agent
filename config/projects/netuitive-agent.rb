
name "netuitive-agent"
maintainer "Netuitive, Inc"
homepage "http://www.netuitive.com"

# Defaults to C:/netuitive on Windows
# and /opt/netuitive on all other platforms
install_dir "#{default_root}/#{name}"

build_version '0.5.6'
build_iteration 1

# Creates required build directories
dependency "preparation"


# netuitive diamond agent
dependency "netuitive-diamond"

# netuitive statsd
dependency "netuitive-statsd"

# netuitive event handler
dependency "netuitive-event-handler"

# Version manifest file
dependency "version-manifest"

exclude "**/.git"
exclude "**/bundler/git"
exclude "**/.gitkeep"

# main config
config_file "#{install_dir}/conf/netuitive-agent.conf"

# default collector configs
config_file "#{install_dir}/conf/collectors/CassandraJolokiaCollector.conf"
config_file "#{install_dir}/conf/collectors/ElasticSearchCollector.conf"
config_file "#{install_dir}/conf/collectors/FlumeCollector.conf"
config_file "#{install_dir}/conf/collectors/HeartbeatCollector.conf"
config_file "#{install_dir}/conf/collectors/HttpCodeCollector.conf"
config_file "#{install_dir}/conf/collectors/HttpdCollector.conf"
config_file "#{install_dir}/conf/collectors/JolokiaCollector.conf"
config_file "#{install_dir}/conf/collectors/KafkaCollector.conf"
config_file "#{install_dir}/conf/collectors/KafkaConsumerLagCollector.conf"
config_file "#{install_dir}/conf/collectors/KafkaJolokiaCollector.conf"
config_file "#{install_dir}/conf/collectors/MongoDBCollector.conf"
config_file "#{install_dir}/conf/collectors/MySQLCollector.conf"
config_file "#{install_dir}/conf/collectors/NginxCollector.conf"
config_file "#{install_dir}/conf/collectors/PostgresqlCollector.conf"
config_file "#{install_dir}/conf/collectors/ProcessResourcesCollector.conf"
config_file "#{install_dir}/conf/collectors/RabbitMQCollector.conf"
config_file "#{install_dir}/conf/collectors/RedisCollector.conf"
config_file "#{install_dir}/conf/collectors/SNMPCollector.conf"
config_file "#{install_dir}/conf/collectors/SNMPInterfaceCollector.conf"
config_file "#{install_dir}/conf/collectors/SolrCollector.conf"
config_file "#{install_dir}/conf/collectors/UserScriptsCollector.conf"
