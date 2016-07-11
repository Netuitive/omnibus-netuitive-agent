name "python-libvirt"
default_version "2.0.0"

dependency "libvirt"
dependency "python"
dependency "pip"

build do
  command "#{install_dir}/embedded/bin/pip install -I --install-option=\"--install-scripts=#{install_dir}/bin\" libvirt-python=#{version}"
end
