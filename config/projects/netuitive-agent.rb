
name "netuitive-agent"
maintainer "Netuitive, Inc"
homepage "http://www.netuitive.com"

# Defaults to C:/netuitive on Windows
# and /opt/netuitive on all other platforms
install_dir "#{default_root}/#{name}"

build_version '0.2.8'
build_iteration 1

# Creates required build directories
dependency "preparation"


# netuitive diamond agent
dependency "netuitive-diamond"

# netuitive statsd
dependency "netuitive-statsd"

# Version manifest file
dependency "version-manifest"

exclude "**/.git"
exclude "**/bundler/git"
exclude "**/.gitkeep"

# main config
config_file "#{install_dir}/conf/netuitive-agent.conf"

# default collector configs
config_file "#{install_dir}/conf/collectors/HttpdCollector.conf"
config_file "#{install_dir}/conf/collectors/MySQLCollector.conf"
config_file "#{install_dir}/conf/collectors/HttpCodeCollector.conf"


