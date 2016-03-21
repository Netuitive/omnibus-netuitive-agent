name "netuitive"
default_version "master"

dependency "python"
dependency "pip"

source git: "https://github.com/Netuitive/netuitive-client-python.git"

build do
  command "#{install_dir}/embedded/bin/python setup.py install"
end

