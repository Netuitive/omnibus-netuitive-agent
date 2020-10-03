name "portalocker"
default_version "1.7.0"

dependency "python"
dependency "pip"

build do
  command "#{install_dir}/embedded/bin/pip install -I -t #{install_dir}/embedded/lib/python2.7 #{name}==#{version}"
end
