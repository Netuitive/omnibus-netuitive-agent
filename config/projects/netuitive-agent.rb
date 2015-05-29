
name "netuitive-agent"
maintainer "Netuitive, Inc"
homepage "http://www.netuitive.com"

# Defaults to C:/netuitive on Windows
# and /opt/netuitive on all other platforms
install_dir "#{default_root}/#{name}"

build_version "0.0.1"
build_iteration 2

# Creates required build directories
dependency "preparation"


# netuitive diamond agent
dependency "netuitive-diamond"

# Version manifest file
dependency "version-manifest"

exclude "**/.git"
exclude "**/bundler/git"
