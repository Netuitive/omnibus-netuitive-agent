name "docker-py"
default_version "1.10.6"

dependency "python"
dependency "pip"

build do
  command "#{install_dir}/embedded/bin/pip install -I --install-option=\"--install-scripts=#{install_dir}/bin\" #{name}==#{version}"
end
