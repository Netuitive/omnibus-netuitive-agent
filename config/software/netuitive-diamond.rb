name "netuitive-diamond"
default_version "a92472c"

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

  # Netuitive collectors
  copy "/var/cache/omnibus/netuitive/src/collectors/netuitivedocker", "#{install_dir}/collectors/"
  copy "/var/cache/omnibus/netuitive/src/collectors/memory/memory.py", "#{install_dir}/collectors/memory/memory.py"
  copy "/var/cache/omnibus/netuitive/src/collectors/network/network.py", "#{install_dir}/collectors/network/network.py"


  # Diamond bin
  copy "bin/diamond", "#{install_dir}/bin"
  copy "bin/diamond", "#{install_dir}/bin/netuitive-agent"
  copy "/var/cache/omnibus/netuitive", "#{install_dir}"

  # Configuration file
  mkdir "#{install_dir}/conf"
  copy "/var/cache/omnibus/netuitive/conf/netuitive-agent.conf", "#{install_dir}/conf/netuitive-agent.conf"

  # Log directory
  mkdir "#{install_dir}/log"


  # Diamond
  copy "src/diamond", "#{install_dir}/embedded/lib/python2.7/site-packages"

  # Diamond Handlers
  mkdir "#{install_dir}/handlers"
  copy "/var/cache/omnibus/netuitive/src/handler/netuitive_cloud.py", "#{install_dir}/embedded/lib/python2.7/site-packages/diamond/handler/"
    command "chmod 0775 " \
          " /var/cache/omnibus/package-scripts/netuitive-agent/*"

end
