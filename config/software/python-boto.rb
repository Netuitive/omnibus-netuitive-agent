name "boto"
default_version "2.49.0"

dependency "python"
dependency "pip"

build do
  # We don't want the boto scripts, so put them in /tmp
  command "#{install_dir}/embedded/bin/pip install -I --install-option=\"--install-scripts=/tmp\" #{name}==#{version}"
end
