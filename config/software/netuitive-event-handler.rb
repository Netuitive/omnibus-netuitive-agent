name "netuitive-event-handler"
default_version "latest"

# eventually this should be turned into a full git clone and build like the others

source :url => "http://repos.app.netuitive.com/cli-agent/netuitive-event-handler-linux",
       :md5 => '4adf233642325b04aff1955761d0917d'


build do
  # License
  copy "netuitive-event-handler-linux", "#{install_dir}/bin/netuitive-event-handler"
  command "chmod 0700 " \
          "#{install_dir}/bin/netuitive-event-handler"
end

