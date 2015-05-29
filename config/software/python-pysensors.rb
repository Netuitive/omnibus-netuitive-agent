name "pysensors"
default_version "0.0.3"

dependency "lm_sensors"
dependency "python"
dependency "pip"

build do
  command "#{install_dir}/embedded/bin/pip install -I --install-option=\"--install-scripts=#{install_dir}/bin\" #{name}==#{version}"
end
