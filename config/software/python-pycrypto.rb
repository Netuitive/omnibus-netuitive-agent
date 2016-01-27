name "pycrypto"
default_version "2.6.1"

dependency "python"
dependency "pip"
dependency "gmp"

build do
  command "#{install_dir}/embedded/bin/pip install -I --install-option=\"--install-scripts=#{install_dir}/bin\" #{name}==#{version}"
end
