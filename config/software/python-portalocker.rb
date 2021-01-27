name "portalocker"
default_version "1.7.0"

dependency "python"
dependency "pip"

build do
  # this is -U because portalocker is already installed and we need to downgrade it
  command "#{install_dir}/embedded/bin/pip install -U -t #{install_dir}/embedded/lib/python2.7 #{name}==#{version}"
end
