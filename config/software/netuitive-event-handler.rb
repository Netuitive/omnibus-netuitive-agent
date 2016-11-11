name "netuitive-event-handler"
default_version "latest"

# eventually this should be turned into a full git clone and build like the others

source :url => "http://repos.app.netuitive.com/cli-agent/netuitive-event-handler-linux",
       :md5 => '10a5f74d25daa94c652066783b82a95b'


build do
  # License
  copy "netuitive-event-handler-linux", "#{install_dir}/bin/netuitive-event-handler"
  command "chmod 0700 " \
          "#{install_dir}/bin/netuitive-event-handler"
end

