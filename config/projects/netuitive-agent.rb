
name "netuitive-agent"
maintainer "Netuitive, Inc"
homepage "http://www.netuitive.com"

# Defaults to C:/netuitive on Windows
# and /opt/netuitive on all other platforms
install_dir "#{default_root}/#{name}"

build_version "0.1.2"
build_iteration 1

# Creates required build directories
dependency "preparation"


# netuitive diamond agent
dependency "netuitive-diamond"

# Version manifest file
dependency "version-manifest"

exclude "**/.git"
exclude "**/bundler/git"
exclude "**/.gitkeep"

config_file "#{install_dir}/conf/netuitive-agent.conf"

