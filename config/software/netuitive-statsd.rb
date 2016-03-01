name "netuitive-statsd"
default_version "master"

dependency "python"
dependency "pip"
dependency "python-configobj"
dependency "python-psutil"
dependency "python-setproctitle"
dependency "python-statsd"
dependency "python-netuitive"

source git: "https://github.com/Netuitive/netuitive-statsd.git"


build do
  command "#{install_dir}/embedded/bin/python setup.py install"

end
