name "netuitive-diamond"
default_version "master"

dependency "postgresql"
dependency "mysql-client"
dependency "python"
dependency "pip"
dependency "python-configobj"
dependency "python-psutil"
dependency "python-setproctitle"



# Handlers dependency
dependency "python-netuitive"
dependency "python-statsd"
# Collectors dependency
dependency "python-mysql"
dependency "python-beanstalkc"
dependency "python-docker-py"
dependency "python-pymongo"
dependency "python-pyutmp"
dependency "python-redis"
dependency "python-psycopg2"
dependency "python-boto"
dependency "python-pysensors"
dependency "python-pysnmp"
dependency "python-supervisor"

# Sources may be URLs, git locations, or path locations
#source git: "https://github.com/Netuitive/Diamond.git"
#source path: "/vagrant/Diamond"
source git: "https://github.com/Netuitive/Diamond.git"

# This is the path, inside the tarball, where the source resides
relative_path "Diamond"

build do
  # License
  copy "LICENSE", "#{install_dir}"

  # Diamond collectors
  copy "src/collectors", "#{install_dir}"

  # Diamond bin
  copy "bin/diamond", "#{install_dir}/bin/netuitive-agent"
  command "sed -i -e s:'/usr/bin/env python':'/opt/netuitive-agent/embedded/bin/python':g #{install_dir}/bin/netuitive-agent"

  copy "/var/cache/omnibus/netuitive", "#{install_dir}/.install"

  # Configuration file
  mkdir "#{install_dir}/conf"
  command "cp -R /var/cache/omnibus/netuitive/conf/collectors #{install_dir}/conf/collectors"
  copy "/var/cache/omnibus/netuitive/conf/netuitive-agent.conf", "#{install_dir}/conf/netuitive-agent.conf"
  copy "/var/cache/omnibus/netuitive/conf/supervisor.conf", "#{install_dir}/conf/supervisor.conf"


  # Log directory
  mkdir "#{install_dir}/log"

  # Diamond
  copy "src/diamond", "#{install_dir}/embedded/lib/python2.7/site-packages"

    command "chmod 0775 " \
          " /var/cache/omnibus/package-scripts/netuitive-agent/*"

    command "chmod 700 #{install_dir}/.install/scripts/*"

end
