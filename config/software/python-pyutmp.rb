name "pyutmp"
default_version "0.2.1"

dependency "python"
dependency "pip"
dependency "python-cython"

build do
  command "#{install_dir}/embedded/bin/pip install -I --install-option=\"--install-scripts=#{install_dir}/bin\" #{name}==#{version}"
end
