name "pysnmp"
default_version "4.3.2"

dependency "python"
dependency "pip"
dependency "python-pyasn1"
dependency "python-pycrypto"

build do
  command "#{install_dir}/embedded/bin/pip install -I --install-option=\"--install-scripts=#{install_dir}/bin\" #{name}==#{version}"
end
